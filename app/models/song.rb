class Song < ApplicationRecord
  belongs_to :artist
  
  has_many   :list_songs, dependent: :restrict_with_error
  validates  :name , :artist , :album , :duration ,presence: true
end
