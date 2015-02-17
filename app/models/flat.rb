class Flat < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :price, presence: true
  validates :availability, null: true
  validates :user_id, presence: true, uniqueness: true

  has_attached_file :picture,
  styles: { medium: "300x300>", thumb: "100x100>" }

  validates_attachment_content_type :picture,
  content_type: /\Aimage\/.*\z/

end