class Categoria < ActiveRecord::Base
	set_table_name :categorias
	
	attr_accessible :nombre
	has_many :voto_categorias
	validates_presence_of :nombre

end