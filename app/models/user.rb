class User < ActiveRecord::Base
  after_create :send_welcome_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
         :registerable,
         :recoverable,
         :rememberable,
         :trackable,
         :validatable
         # module activé depuis devise
         # confirmable (d'email) n'est pas activé ici

  has_many :flats

  # validates :name, presence: true, uniqueness: true
  # validates :email, presence: true, uniqueness: true, format: { with: /\A.*@.*\.com\z/ }
  # validates :phone_number, presence: true, uniqueness: true, format: { with: /\d{10}/ }, numericality: { only_interger: true }
  private

  def send_welcome_email
    UserMailer.welcome(self).deliver
  end
end
