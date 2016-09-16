class FacebookUser < ActiveRecord::Base
  has_many :comments, dependent: :destroy
  has_many :valuations, dependent: :destroy

  validates :nickname, presence: true, length: {minimum: 1, maximum: 20}
  
  def self.from_omniauth(auth)
    #where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.provider = auth.provider
      user.uid = auth.uid
      user.name = auth.info.name
      user.nickname = "세종대학생"
      user.oauth_token = auth.credentials.token
      user.oauth_expires_at = Time.at(auth.credentials.expires_at)
      user.save!
    end
  end
end