class Artist < ApplicationRecord
    has_many  :songs  ,dependent: :destroy
    validates :name, presence: true
    validates :genres, presence: true
    validates :country, presence: true
    validates :active, presence: true
    validates :name, uniqueness: true
end
