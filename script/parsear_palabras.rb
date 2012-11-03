# encoding: utf-8

# Ejecutar con rails runner script/parsear_palabras.rb

require 'csv'

no_encontrados = 0
encontrados = 0

CSV.parse(File.read("db/csvs/palabras_por_diputado_2011.csv")) do |row|
	
	cantidad = row[0]
	apellido = row[1].strip
	nombre = row[2].strip
	
	l = Legislador.where("nombre like ? and apellido like ? ", nombre + "%", apellido + "%" )
	if l.first
		#puts l.first.apyn + ": " + row[0] + " palabras"
		encontrados+=1
		Palabra.create(:anio => 2011, :legislador_id => l.first.id, :cantidad => row[0])
	else
		puts "No se encontró a " + apellido + ", " + nombre
		#puts "SQL: " + Legislador.where("nombre like ? and apellido like ? ", nombre + "%", apellido + "%" ).to_sql
		no_encontrados+=1
	end
end

puts encontrados.to_s + " sí encontrados"
puts no_encontrados.to_s + " no encontrados"
