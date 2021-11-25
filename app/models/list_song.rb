class ListSong < ApplicationRecord
  belongs_to :playlist 
  belongs_to :song 
  validates  :song , :playlist ,presence: true
  scope :user_list_songs, ->(user) { joins(:playlist).where(['user_id = ?', user.id]) }
end
