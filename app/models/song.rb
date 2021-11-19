class Song < ApplicationRecord
  belongs_to :artist
  validates  :name , :artist , :album , :duration ,presence: true
end
