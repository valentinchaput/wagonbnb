class Flat < ActiveRecord::Base
  belongs_to :user
  has_many :bookings

  validates :title, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :price, presence: true
  # validates :availability, null: true
  # validates :user_id, presence: true, uniqueness: true

  has_attached_file :picture,
  styles: { medium: "400x400>", thumb: "200x200>" }

  validates_attachment_content_type :picture,
  content_type: /\Aimage\/.*\z/

  def self.search(search)
    where("city iLIKE ?", "%#{search}%")
  end

  def available?(b)
    output = true
    bookings.select { |bkg| bkg.status }.each do |booking|
      if booking.checkin <= b.checkout && booking.checkout >= b.checkin
        output = false
      end
    end
    output
  end
end
