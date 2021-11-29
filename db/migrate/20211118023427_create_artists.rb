class CreateArtists < ActiveRecord::Migration[5.2]
  def change
    create_table :artists do |t|
      
      t.string :name, unique: true ,null: false
      t.string :genres, null: false
      t.string :country, null: false
      t.date :active, null: false

      t.timestamps
    end
  end
end
