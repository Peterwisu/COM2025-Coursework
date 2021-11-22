require 'test_helper'

class PlaylistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  

  test'should not save empty song ' do

    my_playlist =Playlist.new
    my_playlist.save
    refute my_playlist.valid?
    
  end


  test'save valid song ' do

    my_playlist =Playlist.new
    my_playlist.name = 'My Playlist'
    my_playlist.created_by = 'By me'
    my_playlist.save

    assert my_playlist.valid?
    
  end
  test 'duplicate should not save' do

    my_playlist1 =Playlist.new
    my_playlist1.name = 'My Playlist'
    my_playlist1.created_by = 'By me'
    my_playlist1.save

    my_playlist2 =Playlist.new
    my_playlist2.name = 'My Playlist'
    my_playlist2.created_by = 'By me'
    my_playlist2.save

    refute my_playlist2.valid?
  end
end
