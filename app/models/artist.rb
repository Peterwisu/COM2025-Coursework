class Artist < ApplicationRecord
    #Artist belong to only one user
    belongs_to :user
    #Artist has many songs 
    has_many  :songs  ,dependent: :destroy
    #check a presence 
    validates :name, presence: true
    validates :genres, presence: true
    validates :country, presence: true
    validates :active, presence: true
    validates :name, uniqueness: true
    #scope artist to a user ,user only see artist that they create
    scope :user_artists, ->(user) { where(['user_id = ?', user.id]) }
end
