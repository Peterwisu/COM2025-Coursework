class CreatePlaylists < ActiveRecord::Migration[5.2]
  def change
    create_table :playlists do |t|
      t.text :name  ,null: false
      t.text :created_by  ,null: false

      t.timestamps
    end
  end
end
