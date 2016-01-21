module ClientsHelper
  def gravatar_for(client)
    gravatar_id = Digest::MD5::hexdigest(client.email.downcase)
    gravatar_url = "https://secure.gravatar.com/avatar/#{gravatar_id}"
    image_tag(gravatar_url, alt: client.name, class: "gravatar")
  end

  def add_message(content, client_id)
    ClientMessage.create :content => content, :client_id => client_id
  end
end
