class Song < ApplicationRecord
  belongs_to :artist
  
  has_many   :list_song, dependent: :destroy
  validates  :name , :artist , :album , :duration ,presence: true
  validates  :name , uniqueness: { scope: :artist_id } 
  scope :user_songs, ->(user) { joins(:artist).where(['user_id = ?', user.id]) }
end
