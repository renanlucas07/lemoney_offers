class Offer < ApplicationRecord
  has_enumeration_for :state, create_helpers: true

  validates_presence_of :advertiser_name,
                        :url,
                        :description,
                        :starts_at
  validates :advertiser_name, uniqueness: true
  validates :url, uri: true
  validates :description, length: { maximum: 500 }

  before_create :set_state

  def to_s
    advertiser_name
  end

  private
  def set_state
    current_time = DateTime.now

    if current_time >= self.starts_at
      if self.ends_at.nil?
        self.state = State::ENABLED
      elsif current_time <= self.ends_at
        self.state = State::ENABLED
      else
        self.state = State::DISABLED
      end
    else
      self.state = State::DISABLED
    end
  end
end
