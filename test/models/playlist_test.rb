require 'test_helper'

class PlaylistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #create a global variable and retrieve value from fixture
  setup do
    @user = users(:one)
    end
  
  #Test to check an playlist with null value on fields is unvalid and can not be saved
  test'Should not save empty playlist ' do

    my_playlist =Playlist.new
    my_playlist.save
    refute my_playlist.valid?
    
  end

  #Test to check an playlist with correct type and value on fields is valid and can  be saved
  test'Save valid playlist ' do

    my_playlist =Playlist.new
    my_playlist.name = 'My Playlist'
    my_playlist.created_by = 'By me'
    my_playlist.user = @user
    my_playlist.save

    assert my_playlist.valid?
    
  end
  #Test to check an list_songs with duplicate value on primary is unvalid and can not be saved
  test 'Duplicate playlist should not save' do

    my_playlist1 =Playlist.new
    my_playlist1.name = 'My Playlist'
    my_playlist1.created_by = 'By me'
    my_playlist1.user = @user
    my_playlist1.save

    my_playlist2 =Playlist.new
    my_playlist2.name = 'My Playlist'
    my_playlist2.created_by = 'By me'
    my_playlist2.user = @user
    my_playlist2.save

    refute my_playlist2.valid?
  end
end
