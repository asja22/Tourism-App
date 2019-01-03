class Package < ApplicationRecord
  belongs_to :agent
  
  
  belongs_to :country
  belongs_to :province
 
  default_scope -> { order(created_at: :desc) }
  validates :agent_id, :name, :days, :nights, :country_id, :province_id, :itinerary, :price, :includes, presence: true
  validates :departure, presence: true, length: { maximum: 15 }
  
  scope :approved?, -> { where(:approved => false) }
end
