class Palabra < ActiveRecord::Base
	attr_accessible :legislador_id, :anio, :cantidad

	validates_numericality_of :anio, :cantidad

	validates_presence_of :legislador_id
end