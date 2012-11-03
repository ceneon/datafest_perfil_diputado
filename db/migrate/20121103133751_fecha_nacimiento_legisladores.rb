class FechaNacimientoLegisladores < ActiveRecord::Migration
  def change
  	add_column :legisladors, :fecha_nacimiento, :date

	create_table :palabras do |t|
		t.integer :legislador_id
		t.integer :anio
		t.integer :cantidad
	end


  end
end
