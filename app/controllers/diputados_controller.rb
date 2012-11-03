class DiputadosController < ApplicationController

	def index

		@diputados = Legislador.where(:es_diputado => true).order(:apellido, :nombre)

	end #index


end
