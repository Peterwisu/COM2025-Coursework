require 'test_helper'

class ListSongsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  #create a global variable and retrieve value from fixture
  setup do
    @list_song = list_songs(:one)
    @song   = songs(:one)
    @playlist = playlists(:one)
    @user = users(:one)
    sign_in @user
  end

  

  test "should get new" do
    get new_list_song_url, params: {list_song: {playlist_id: @playlist.id, song_id:@song.id}}
    assert_response :success
  end

  test "should create list_song" do
    assert_difference('ListSong.count') do
      post list_songs_url, params: { list_song: { playlist_id: @playlist.id, song_id:@song.id } }
    end

    assert_redirected_to  playlist_path(ListSong.last.playlist_id)
  end


  

  test "should destroy list_song" do
    assert_difference('ListSong.count', -1) do
      delete list_song_url(@list_song)
    end

    assert_redirected_to playlist_path(@list_song.playlist_id)
  end
end
