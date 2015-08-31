class User < ActiveRecord::Base
  before_save :choose_color

  has_and_belongs_to_many :groups
  has_many :owned_groups, class_name: "Group", foreign_key: :user_id

  has_many :invitations
  has_many :photos

  # validates :phone_number, :length => { :minimum => 10, :maximum => 15 }
  validate :phone_number_regex

  def choose_color
    self.color = ["blue", "brown", "darkgreen", "green", "orange", "paleblue", "pink", "purple", "red", "yellow"].sample
  end

  def phone_number_regex
    return true unless self.phone_number
    num = self.phone_number
    num = num.gsub(/[^0-9.]/, "")
    if num.length == 10
      new_num = "+1" + num
      self.phone_number = new_num
    end
  end

  def self.from_omniauth(auth)
    user = User.find_or_create_by(provider: auth.provider, uid: auth.uid)
    user.name = auth.info.name
    user.email = auth.info.email

    user.oauth_token = auth.credentials.token
    user.oauth_expires_at = Time.at(auth.credentials.expires_at)

    user.save!

    user
  end

  def facebook
    @facebook ||= Koala::Facebook::API.new(oauth_token)
  end
end
