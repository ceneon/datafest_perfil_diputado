class Palabra < ActiveRecord::Base
	attr_accessible :legislador_id, :anio, :cantidad

	validates_numericality_of :anio, :cantidad

	validates_presence_of :legislador_id


	def self.maximo_del_anio(anio)
		Palabra.where(:anio => anio).maximum(:cantidad)
	end

end