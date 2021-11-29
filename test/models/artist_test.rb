require 'test_helper'

class ArtistTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end

  #create a global variable and retrieve value from fixture
  setup do
    @user = users(:one)
    end

  #Test to check an Artist with null value on fields is unvalid and can not be saved
  test 'Empty artist can not be save' do
    my_artist= Artist.new
    my_artist.save

    refute my_artist.valid?
  end 
  #Test to check an Artist with correct type and value on fields is valid and can be saved
  test 'Save valid artist' do
    my_artist= Artist.new
    my_artist.name = 'BMTH'
    my_artist.genres = 'heavy metal'
    my_artist.country = 'UK'
    my_artist.active = '2006-02-01'
    my_artist.user =@user
    my_artist.save

    assert my_artist.valid?
  end
  #Test to check an  two Artist with duplicate value on primary keys is unvalid and can not be saved
  test 'Duplicate  artist should not be save' do
    my_artist1= Artist.new
    my_artist1.name = 'BMTH'
    my_artist1.genres = 'heavy metal'
    my_artist1.country = 'UK'
    my_artist1.active = '2006-02-01'
    my_artist1.save

    my_artist2= Artist.new
    my_artist2.name = 'BMTH'
    my_artist2.genres = 'heavy metal'
    my_artist2.country = 'UK'
    my_artist2.active = '2006-02-01'
    my_artist2.save

    

    refute my_artist2.valid?
  end

end
