class AddIndexToPlaylist < ActiveRecord::Migration[5.2]
  def change
    add_index :playlists,[:name,:created_by,:user_id],unique: true
  end
end
