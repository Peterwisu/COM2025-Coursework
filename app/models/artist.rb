class Artist < ApplicationRecord
    has_many  :songs  ,dependent: :destroy
    validates :name, presence: true
    validates :genres, presence: true
    validates :country, presence: true
    validates :active, presence: true
    validates :name, uniqueness: true
    belongs_to :user
    scope :user_artists, ->(user) { where(['user_id = ?', user.id]) }
end
