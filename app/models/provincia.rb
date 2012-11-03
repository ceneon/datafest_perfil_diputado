class Provincia < ActiveRecord::Base
	set_table_name :provincias
	validates_presence_of :nombre

	has_many :legisladors

end