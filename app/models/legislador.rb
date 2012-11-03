class Legislador < ActiveRecord::Base
	attr_accessible :apellido, :nombre, :provincia_id, :mandato_inicio, :mandato_fin, :es_diputado, :es_senador, :actual, :bloque_actual_id, :key, :email


	belongs_to :provincia
	belongs_to :bloque_actual, :class_name => "Bloque"

	#has_and_belongs_to_many :comisions

	def url_foto_mediana
		if self.es_diputado? and self.key.present?
			"http://www1.hcdn.gov.ar/fotos/" + self.key + "_mediana.jpg"
		elsif self.es_senador?
			""
		else
			""
		end
	end

	def url_foto_grande
		if self.es_diputado? and self.key.present?
			"http://www1.hcdn.gov.ar/fotos/" + self.key + ".jpg"
		elsif self.es_senador?
			""
		else
			""
		end
	end

end