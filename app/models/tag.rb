class Tag < ApplicationRecord
    has_many :influencer_tags
    has_many :influencers, through: :influencer_tags

    validates :name, presence: true
    validates :name, uniqueness: true
end
