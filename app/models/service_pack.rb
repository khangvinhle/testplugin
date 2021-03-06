class ServicePack < ApplicationRecord
  has_many :assigns
  has_many :projects, through: :assigns
  has_many :enumerations, through: :mapping_rates

  validates_presence_of :name, :threshold1, :threshold2, :expired_date, :start_date, :total_units
  validates_uniqueness_of :name
  validates_numericality_of :total_units, only_integer: true, less_than: 10000
  validates_numericality_of :threshold1, :threshold2, greater_than_or_equal_to: 1, less_than_or_equal_to: 100, :only_integer => false
  validate :threshold2_is_greater_than_threshold1
  validate :end_after_start

  private

  def expired?
    true if Time.now > expired_date
  end

  def threshold2_is_greater_than_threshold1
    @errors.add(:threshold2, 'must be less than threshold 1') if threshold2 > threshold1
  end

  def end_after_start
    @errors.add(:expired_date, 'must be after start date') if expired_date < start_date
  end
end
