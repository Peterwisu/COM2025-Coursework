class Song < ApplicationRecord
  # song belong to only one artist
  belongs_to :artist
  # songs has many to many relationship to playlists,So it has list_song as its join table with one to one relationship 
  has_many   :list_song, dependent: :destroy
  # check presence  
  validates  :name , :artist , :album , :duration ,presence: true
  # check uniqueness of name along with artist_id as a composite primary keys
  validates  :name , uniqueness: { scope: :artist_id } 
  # scope songs to a user ,user only see songs that they create
  scope :user_songs, ->(user) { joins(:artist).where(['user_id = ?', user.id]) }
end
