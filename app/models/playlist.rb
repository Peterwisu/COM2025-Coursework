class Playlist < ApplicationRecord
    # Playlists has many to many relationship to songs,So it has list_song as its join table with one to one relationship 
    has_many  :list_song ,dependent: :destroy
    # Playlist belong to only one user
    belongs_to :user
    # check presence
    validates  :name , :created_by ,presence: true
    # check uniqueness of name along with created_by as a composite primary keys
    validates  :name , uniqueness: { scope: :created_by}
    # scope artist to a user ,user only see artist that they create
    scope :user_playlists, ->(user) { where(['user_id = ?', user.id]) }
end
