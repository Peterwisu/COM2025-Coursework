class Song < ApplicationRecord
    validates_presence_of :name, :artist, :album, :duration
end
