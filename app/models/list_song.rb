class ListSong < ApplicationRecord
  #list_song belong to only one playlist
  belongs_to :playlist 
  #list_song belong to only one song
  belongs_to :song 
  # check presence
  validates  :song , :playlist ,presence: true
  # scope list_song to a user ,user only see list_song that they create
  scope :user_list_songs, ->(user) { joins(:playlist).where(['user_id = ?', user.id]) }
end
