class Client < ActiveRecord::Base
  has_many :deposits
  has_many :client_messages

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_initialize.tap do |client|
      client.provider = auth.provider
      client.uid = auth.uid
      client.name = auth.info.name
      client.role = 0
      client.oauth_token = auth.credentials.token
      client.oauth_expires_at = Time.at(auth.credentials.expires_at)
      client.save!
    end
  end

  def add_message(content, client_id)
      ClientMessage.create :content => content, :client_id => client_id
  end

  def self.define_role(role_id)
    case role_id
    when 0
      'client'
    when 2
      'deposer'
    end
  end

end
