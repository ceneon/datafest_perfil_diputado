# encoding:utf-8
class Legislador < ActiveRecord::Base
	attr_accessible :apellido, :nombre, :provincia_id, :mandato_inicio, :mandato_fin, :es_diputado, :es_senador, :actual, :bloque_actual_id, :key, :email


	belongs_to :provincia
	belongs_to :bloque_actual, :class_name => "Bloque"
	has_many :palabras

	#has_and_belongs_to_many :comisions

	def url_foto_mediana
		if self.es_diputado? and self.key.present?
			"http://www1.hcdn.gov.ar/fotos/" + self.key + "_medium.jpg"
		elsif self.es_senador?
			""
		else
			"/images/avatar_chico.png"
		end
	end

	def url_foto_grande
		if self.es_diputado? and self.key.present?
			"http://www1.hcdn.gov.ar/fotos/" + self.key + ".jpg"
		elsif self.es_senador?
			""
		else
			"/images/avatar_grande.png"
		end
	end

	def apyn
		self.apellido + ", " + self.nombre
	end

	def periodo
		if self.mandato_inicio and self.mandato_fin
			if self.mandato_inicio.month > 1 and self.mandato_fin.month > 1
				self.mandato_inicio.strftime("%d/%m/%Y") + " a " + self.mandato_fin.strftime("%d/%m/%Y")
			else
				self.mandato_inicio.year.to_s + " a " + self.mandato_fin.year.to_s
			end
		else
			""
		end
	end #periodo

	def edad
		if self.fecha_nacimiento
			Date.today.year - self.fecha_nacimiento.year - (self.fecha_nacimiento.to_date.change(:year => Date.today.year) > Date.today ? 1 : 0)
		end
	end
			

end