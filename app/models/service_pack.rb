class ServicePack < ApplicationRecord
  validates :name, presence: true, uniqueness: true
  validates :duration, presence: true, numericality: {greater_than: 1}
  validates :threshold1, presence: true, inclusion: 1..100
  validates :threshold2, presence: true, inclusion: 1..100
  validate :threshold2_is_greater_than_threshold1
  validates :total_units, presence: true

  def expired?
    true if Time.now > expired_date
  end

  def threshold2_is_greater_than_threshold1
    @errors.add(:threshold2, 'must be less than threshold 1') if threshold2 > threshold1
  end
end
