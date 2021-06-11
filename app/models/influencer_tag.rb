class InfluencerTag < ApplicationRecord
  belongs_to :influencer
  belongs_to :tag

  validates :influencer_id, uniqueness: { scope: :tag_id }
end
