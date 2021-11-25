class Playlist < ApplicationRecord
    has_many  :list_song ,dependent: :destroy
    validates  :name , :created_by ,presence: true
    validates  :name , uniqueness: { scope: :created_by}
end
