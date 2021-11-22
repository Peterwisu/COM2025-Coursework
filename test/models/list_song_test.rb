require 'test_helper'

class ListSongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  setup do
    @song   = songs(:one)
    @playlist = playlists(:one)
  end


 
  test'should not save empty  ' do

    my_list = ListSong.new
    my_list.save
    refute my_list.valid?
    
  end


  test'save valid  ' do

    my_list = ListSong.new
    my_list.playlist_id =@playlist.id
    my_list.song_id =@song.id
    my_list.save

    assert my_list.valid?
    
  end

  


end
