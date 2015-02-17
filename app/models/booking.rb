class Booking < ActiveRecord::Base
  belongs_to :user
  belongs_to :flat

  validates :checkin, presence: true
  validates :checkout, presence: true
  validates :user_id, presence: true #, uniqueness: true
  validates :flat_id, presence: true #, uniqueness: true
end
