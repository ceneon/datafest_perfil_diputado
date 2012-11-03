class Legislador < ActiveRecord::Base
	attr_accessible :apellido, :nombre, :provincia_id, :mandato_inicio, :mandato_fin, :es_diputado, :es_senador, :actual, :bloque_actual_id, :key, :email


	belongs_to :provincia
	belongs_to :bloque

	#has_and_belongs_to_many :comisions

end