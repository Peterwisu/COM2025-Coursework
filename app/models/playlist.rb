class Playlist < ApplicationRecord
    has_many  :list_songs ,dependent: :destroy
    validates  :name , :created_by ,presence: true
end
