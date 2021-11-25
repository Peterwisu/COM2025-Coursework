class AddUsersToPlaylist < ActiveRecord::Migration[5.2]
  def up
    add_reference :playlists, :user, index: true
    Playlist.reset_column_information
    user = User.first

    Playlist.all.each do |playlist|
    playlist.user_id = user.id
    playlist.save!
    end

    change_column_null :playlists, :user_id, false
    add_foreign_key :playlists, :users
    end

    def down
      remove_foreign_key :playlists, :users
      remove_reference :playlists, :user, index: true
      end  
    
end
