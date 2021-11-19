require 'test_helper'

class SongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  setup do
    @artist = artists(:one)
  end

  test'should not save empty song ' do

    my_song = Song.new
    my_song.save
    refute my_song.valid?
    
  end


  test'save valid song ' do

    my_song = Song.new
    my_song.name = 'School'
    my_song.artist = @artist
    my_song.album ='Bleach'
    my_song.duration = 3.00
    my_song.save

    assert my_song.valid?
    
  end

end
