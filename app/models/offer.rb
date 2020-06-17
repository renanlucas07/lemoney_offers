class Offer < ApplicationRecord
  has_enumeration_for :state, create_helpers: true

  validates_presence_of :advertiser_name,
                        :url,
                        :description,
                        :starts_at
  validates :advertiser_name, uniqueness: true
  validates :url, uri: true
  validates :description, length: { maximum: 500 }

  before_save :set_state

  def to_s
    advertiser_name
  end

  private

end
