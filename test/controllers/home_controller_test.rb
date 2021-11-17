require 'test_helper'

class HomeControllerTest < ActionDispatch::IntegrationTest
  test "should get home" do
    get home_home_url
    assert_response :success
  end

  test "should get song" do
    get home_song_url
    assert_response :success
  end

  test "should get playlist" do
    get home_playlist_url
    assert_response :success
  end

  test "should get artist" do
    get home_artist_url
    assert_response :success
  end

  test "should get contact" do
    get home_contact_url
    assert_response :success
  end

end
