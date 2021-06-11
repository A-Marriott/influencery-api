class Platform < ApplicationRecord
  has_many :influencers

  validates :name, :base_url, presence: true
  validates :name, :base_url, uniqueness: true
end
