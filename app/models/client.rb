class Client < ActiveRecord::Base
   before_save { self.email = email.downcase }
   validates :name, presence: true, length: { maximum: 50 }
  VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
    validates :email, presence:   true,
                      format:     { with: VALID_EMAIL_REGEX },
                      uniqueness: { case_sensitive: false }
   has_secure_password
 #  validates :password, length: { minimum: 6 }
  
  has_many :credits
  has_many :deposits
  has_many :client_messages

  def Client.new_remember_token
    SecureRandom.urlsafe_base64
  end

  def Client.encrypt(token)
    Digest::SHA1.hexdigest(token.to_s)
  end

  def add_message(content, client_id)
      ClientMessage.create :content => content, :client_id => client_id
  end

  def destroy_mesage
  
  end

  def self.define_role(role_id)
    case role_id
    when 0
      'client'
    when 1 
      'creditor'
    when 2
      'deposer'
    end
  end

  private 

    

    def create_remember_token
      token = Client.new_remember_token
      self.remember_token = Client.encrypt(token)
    end
end
