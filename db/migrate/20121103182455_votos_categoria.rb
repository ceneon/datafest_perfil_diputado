class VotosCategoria < ActiveRecord::Migration
  def change


  	create_table :categorias do |t|
  		t.string :nombre
  	end

  	create_table :voto_categorias do |t|
  		t.integer :categoria_id
  		t.integer :legislador_id
  		t.integer :afirmativo
  		t.integer :negativo
  		t.integer :neutro
  	end

  end
end
