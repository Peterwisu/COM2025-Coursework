class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      
      t.text :name, unique: true ,null: false
      t.text :genres, null: false
      t.text :country, null: false
      t.date :active, null: false

      t.timestamps
    end
  end
end
