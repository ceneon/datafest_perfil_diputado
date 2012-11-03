#!/usr/bin/env ruby
# encoding: utf-8

# Ejecutar con rails runner script/parsear_diputados.rb

html = open('http://www.diputados.gov.ar/diputados/listadip.html').read

# arreglar html que está roto en la web de diputados
html = html.gsub("</tr>
		 		
				     
				      
				      <td>", "</tr><tr>
				      <td>").gsub("<tbody>
		 
				     
				      
				      <td>", "<tbody><tr><td>")

doc = Nokogiri::HTML(html)

diputados = []

provincias = [
	'Buenos Aires', 'Cordoba', 'Santa Fe', 'Mendoza', 'Tucuman', 'Entre Rios', 'Salta', 'Misiones', 'Chaco', 'Corrientes', 'Santiago Del Estero', 'Jujuy', 'San Juan', 'Rio Negro', 'Formosa', 'Neuquen', 'Chubut', 'San Luis', 'Catamarca', 'La Rioja', 'La Pampa', 'Santa Cruz', 'Tierra Del Fuego', 'Ciudad De Buenos Aires'
]

puts "Buscando diputados..."

doc.css("#tablaPpal table tbody").children.each{ |row|
	#diputados << {
	l = Legislador.create(
		:apellido => row.children.css("td")[1].children.css("a").first.content.split(",").first.strip.capitalize,
		:nombre => row.children.css("td")[1].children.css("a").first.content.split(",")[1].strip.capitalize,
		:provincia_id => provincias.index(  row.children.css("td")[2].content.split(" ").collect{ |x| x.capitalize}.join(" ")),
		:mandato_inicio => Date.strptime( row.children.css("td")[3].content, "%d/%m/%Y"),
		:mandato_fin => Date.strptime( row.children.css("td")[4].content, "%d/%m/%Y"), 
		:bloque_actual_id => 0,

		:es_diputado => true,
		:es_senador => false,
		:actual => true,
		
		:key => row.children.css("td")[1].children.css("a").first["href"].split("/")[2].strip,
		:email => row.children.css("td")[1].children.css("a").first["href"].split("/")[2].strip + "@diputados.gov.ar"
	#}
	)

}

puts "Resultados:"; puts "------------------"

Legislador.all.each{ |l| 
	puts "Nombre: " + l.apellido + ", " + l.nombre + " - Provincia: " + l.provincia.nombre  
}
#diputados.each{|x| puts "Nombre: " + x[:apellido] + " - Prov: " + x[:provincia_id].to_s + ": " + provincias[x[:provincia_id].to_i] }
#puts diputados.inspect


