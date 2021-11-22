class AddIndexToPlaylist < ActiveRecord::Migration[5.2]
  def change
    add_index :playlists, :name, unique: true
  end
end
