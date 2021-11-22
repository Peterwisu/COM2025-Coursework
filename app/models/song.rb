class Song < ApplicationRecord
  belongs_to :artist
  
  has_many   :list_songs, dependent: :destroy
  validates  :name , :artist , :album , :duration ,presence: true
  validates  :name , uniqueness: { scope: :artist_id }
end
