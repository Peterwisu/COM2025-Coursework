class CreateSongs < ActiveRecord::Migration[5.2]
  def change
    create_table :songs do |t|
      t.belongs_to :artist, foreign_key: true, null: false
      
      t.text :name, null: false
      t.text :album,null: false
      t.decimal :duration, null: false

      t.timestamps
    end
  end
end
