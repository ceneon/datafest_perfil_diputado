class Bloque < ActiveRecord::Base
	attr_accessible :nombre
	validates_presence_of :nombre

	has_many :legisladors

end