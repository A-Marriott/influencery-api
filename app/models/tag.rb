class Tag < ApplicationRecord
    has_many :influencer_tags
    has_many :influencers, through: :influencer_tags
end
