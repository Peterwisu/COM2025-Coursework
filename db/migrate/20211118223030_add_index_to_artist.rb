class AddIndexToArtist < ActiveRecord::Migration[5.2]
  def change
    add_index :artists, [:name,:user_id], unique: true
  end
end
