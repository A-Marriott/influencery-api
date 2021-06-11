class Influencer < ApplicationRecord
  belongs_to :platform
  has_many :influencer_tags
  has_many :tags, through: :influencer_tags

  validates :handle, :followers, :profile_pic_url, presence: true
  validates :handle, uniqueness: { scope: :platform_id }
end
