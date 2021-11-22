class AddIndexToSong < ActiveRecord::Migration[5.2]
  def change
    add_index :Songs, [:name,:artist_id], unique: true
  end
end
