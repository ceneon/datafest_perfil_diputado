# encoding: utf-8

# Ejecutar con rails runner script/parsear_listado_diputados.rb

require 'csv'

no_encontrados = 0

CSV.parse(File.read("db/csvs/listado_diputados_2008_2012.csv")) do |row|
	
	apellido = row[0]
	nombre = row[1]
	nombre_bloque = row[2]
	mandato = row[3]
	fecha_nacimiento = row[4]
	
	l = Legislador.where("nombre like ? and apellido like ? ", nombre + "%", apellido + "%" )
	if l.first 
		if fecha_nacimiento.present?
			l = l.first
			puts "Legislador: " + l.apyn + " - Fecha nacimiento: " + fecha_nacimiento
			l.fecha_nacimiento = Date.strptime(fecha_nacimiento, "%m/%d/%Y")
			l.save
		end
	else
		puts "No se encontró a " + apellido + ", " + nombre + " ; lo agrego!"

		bloque = Bloque.where(:nombre => nombre_bloque)
		if bloque.first
			bloque_id = bloque.first.id
		else
			bloque = Bloque.create(:nombre => nombre_bloque)
			bloque_id = bloque.id
		end

		l = Legislador.new(
			:apellido => apellido,
			:nombre => nombre, 
			:bloque_actual_id => bloque_id,
			:es_diputado => true,
			:es_senador => false,
			:actual => false,
			:mandato_inicio => Date.parse(mandato.split("-")[0] + "-01-01"),
			:mandato_fin => Date.parse(mandato.split("-")[1] + "-01-01")
		)
		if fecha_nacimiento.present?
			l.fecha_nacimiento = Date.strptime(fecha_nacimiento, "%m/%d/%Y")
		end
		l.save!
		no_encontrados+=1
	end
end

puts no_encontrados.to_s + " no encontrados"


