class VotoCategoria < ActiveRecord::Base
	set_table_name :voto_categorias

	attr_accessible :categoria_id, :legislador_id, :afirmativo, :negativo, :neutro

	validates_numericality_of :afirmativo, :negativo, :neutro, :categoria_id, :legislador_id

	validates_presence_of :afirmativo, :negativo, :neutro, :categoria_id, :legislador_id


	belongs_to :categoria
	belongs_to :legislador

end