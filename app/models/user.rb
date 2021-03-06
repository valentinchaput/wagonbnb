class User < ActiveRecord::Base
  after_create :send_welcome_email
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable,
        :registerable,
        :recoverable,
        :rememberable,
        :trackable,
        :validatable,
        :omniauthable, :omniauth_providers => [ :facebook ]
         # module activé depuis devise
         # confirmable (d'email) n'est pas activé ici

  has_many :flats
  has_many :bookings

  validates :name, presence: true
  # validates :email, presence: true, uniqueness: true, format: { with: /\A.*@.*\.com\z/ }
  # validates :phone_number, presence: true

  def self.find_for_facebook_oauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.email = auth.info.email
      user.password = Devise.friendly_token[0,20]  # Fake password for validation
      user.name = auth.info.name
      user.picture = auth.info.image
      user.token = auth.credentials.token
      user.token_expiry = Time.at(auth.credentials.expires_at)
    end
  end

  private

  def send_welcome_email
    UserMailer.welcome(self).deliver
  end
end
