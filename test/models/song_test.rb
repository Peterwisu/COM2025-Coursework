require 'test_helper'

class SongTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
  #create a global variable and retrieve value from fixture
  setup do
    @artist = artists(:one)
  end
  #Test to check an Songs with null value on fields is unvalid and can not be saved
  test'Should not save empty song ' do

    my_song = Song.new
    my_song.save
    refute my_song.valid?
    
  end

  #Test to check an Song with correct and type value on fields is valid and can be saved
  test'Save valid song ' do

    my_song = Song.new
    my_song.name = 'School'
    my_song.artist = @artist
    my_song.album ='Bleach'
    my_song.duration = 3.00
    my_song.save

    assert my_song.valid?
    
  end
  #Test to check an Songs with duplicate value on primary keys is unvalid and can not be saved
  test 'Duplicate song should not be save' do
    my_song1 = Song.new
    my_song1.name = 'School'
    my_song1.artist = @artist
    my_song1.album ='Bleach'
    my_song1.duration = 3.00
    my_song1.save

    
    my_song2 = Song.new
    my_song2.name = 'School'
    my_song2.artist = @artist
    my_song2.album ='Bleach'
    my_song2.duration = 3.00
    my_song2.save

    refute my_song2.valid?

  end

end
