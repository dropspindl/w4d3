# == Schema Information
#
# Table name: users
#
#  id              :bigint(8)        not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#

class User < ApplicationRecord

  
  validates :session_token, presence: true, uniqueness: true
  validates :username, :password_digest,  presence: true
  
  def reset_session_token!
    self.session_token = SecureRandom.urlsafe_base64 
    self.save!
    self.session_token
  end
    
  def password=(password)
    @password = password
    self.password_digest = BCrypt::Password.create(password)
    
  end 
  
  def is_password?(password)
    BCrypt::Password.new(self.password_digest).is_password?(password)
  end
  
  def self.find_by_credentials(user_name, password)
    user = User.find_by(username: user_name)
    return nil if user.nil?
    user.is_password?(password) ? user : nil
  end 
  
  
    
end
