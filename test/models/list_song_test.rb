require 'test_helper'

class ListSongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #create a global variable and retrieve value from fixture
  setup do
    @song   = songs(:one)
    @playlist = playlists(:one)
  end


  #Test to check an listsongs with null value on fields is unvalid and can not be saved
  test'Should not save empty list_song  ' do

    my_list = ListSong.new
    my_list.save
    refute my_list.valid?
    
  end

  #Test to check an listsongs with correct type and value on fields is valid and can be saved
  test'Save valid  list_song' do

    my_list = ListSong.new
    my_list.playlist_id =@playlist.id
    my_list.song_id =@song.id
    my_list.save

    assert my_list.valid?
    
  end

  


end