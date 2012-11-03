#!/usr/bin/env ruby
# encoding: utf-8

# Ejecutar con rails runner script/parsear_categorias_y_votos.rb


require 'csv'

no_encontrados = 0

CSV.parse(File.read("db/csvs/_____.csv")) do |row|

	apellido = row[0]
	nombre = row[1]
	nombre_categoria = row[2]
	afirmativo = row[3]
	negativo = row[4]
	neutro = row[5]

	l = Legislador.where("nombre like ? and apellido like ? ", nombre + "%", apellido + "%" )
	if l.first 
		l = l.first

		puts "Legislador: " + l.apyn + " - " + nombre_categoria + ": " + row[3] + " " + row[4] + " " + row[5]

		c = Categoria.where(:nombre => nombre_categoria)
		if c.first
			categoria = c.first
		else
			c = Categoria.create(:nombre => nombre_categoria)
			categoria = c
		end
=begin
		VotoCategoria.create(
			:categoria_id => categoria.id,
			:legislador_id => l.id
			:afirmativo => row[3],
			:negativo => row[4],
			:neutro => row[5],
		)
=end		
	else
		puts "No se encontró a " + apellido + ", " + nombre + " ; lo agrego!"
		no_encontrados+=1
	end

end





puts no_encontrados.to_s + " no encontrados"


