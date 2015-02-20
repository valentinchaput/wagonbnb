class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :flat

  validates :checkin, presence: true
  validates :checkout, presence: true
  validates :user_id, presence: true #, uniqueness: true
  validates :flat_id, presence: true #, uniqueness: true
  validate :check_dates
  validate :checkin_ok

  def check_dates
    if checkin > checkout
      errors.add :checkout, "Checkout date should be after Checkin"
    end
  end

  def checkin_ok
    if checkin < Date.today
      errors.add :checkin, "Checkin date should be after today"
    end
  end

end
