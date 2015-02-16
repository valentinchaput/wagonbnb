class Flat < ActiveRecord::Base
  belongs_to :user

  validates :title, presence: true
  validates :description, presence: true
  validates :city, presence: true
  validates :price, presence: true
  validates :availability, null: true
  validates :user_id, presence: true, uniqueness: true
end