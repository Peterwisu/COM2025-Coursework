require 'test_helper'

class SongsControllerTest < ActionDispatch::IntegrationTest
  include Devise::Test::IntegrationHelpers
  #create a global variable and retrieve value from fixture
  setup do
    @song = songs(:one)
    @artist =artists(:one)
    @user = users(:one)
    sign_in @user
  end

  test "should get index" do
    get songs_url
    assert_response :success
  end

  test "should get new" do
    get new_song_url, params: {song: { artist_id: @artist.id}}
    assert_response :success
  end

  test "should create song" do
    assert_difference('Song.count') do
      post songs_url, params: { song: { album: @song.album, artist_id: @artist.id, duration: @song.duration, name: @song.name+ ' create'  } }
    end

    assert_redirected_to artist_path(Song.last.artist)
  end

  test "should show song" do
    get song_url(@song)
    assert_response :success
  end

  test "should get edit" do
    get edit_song_url(@song)
    assert_response :success
  end

  test "should update song" do
    patch song_url(@song), params: { song: { album: @song.album, artist_id: @artist.id, duration: @song.duration, name: @song.name+ ' create' } }
    assert_redirected_to song_url(@song)
  end

  test "should destroy song" do
    assert_difference('Song.count', -1) do
      delete song_url(@song)
    end

    assert_redirected_to songs_url
  end
end
