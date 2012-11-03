class Inicial < ActiveRecord::Migration
  def change

  	create_table :legisladors do |t|

  		t.string :apellido
  		t.string :nombre
  		t.integer :provincia_id
  		
  		t.date :mandato_inicio
  		t.date :mandato_fin

  		t.boolean :es_diputado, :default => true
  		t.boolean :es_senador, :default => false
  		t.boolean :actual, :default => false

  		t.integer :bloque_actual_id

  		t.string :key
  		t.string :email


  	end


  	create_table :provincias do |t|
  		t.string :nombre

  	end

  	create_table :bloques do |t|
  		t.string :nombre
  	end

  	create_table :comisions do |t|
  		t.string :nombre
  	end



  end
end
