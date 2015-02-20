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
    bookings.select { |bkg| bkg.status || bkg.status = nil }.each do |booking|
      if booking.checkin <= b.checkout && booking.checkout >= b.checkin
        output = false
      end
    end
    output
  end

  def right_dates?(b)
    output = true
    # bookings.select { |bkg| bkg.status }.each do |booking|
      if b.checkin < Date.today || b.checkin >= b.checkout
        output = false
      end
    # end
    output
  end

  # def pending_request?(b)
  #   output = true
  #   bookings.select { |bkg| bkg.status }.each do |booking|
  #     # si un booking a été réalisé pr une date et un appart donné
  #     # et si ce booking n'a pas encore été validé par le propriétaire
  #     # donc que son statut n'est pas encore passé de nil>true ou de nil>false>true
  #     # ou si son statut est déjà à true
  #     # alors je ne peux pas le booker => message d'erreur

  #     if booking.status = true || if booking.status =  <= b.checkout && booking.checkout >= b.checkin
  #       output = false
  #     end
  #   end
  #   output
  # end
end
