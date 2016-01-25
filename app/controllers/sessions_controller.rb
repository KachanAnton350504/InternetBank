class SessionsController < ApplicationController
  def new
  end
  
  def create
    client = Client.from_omniauth(env["omniauth.auth"])
    session[:client_id] = client.id
    redirect_to client_profile_path(client)
  end

  def destroy
    session[:client_id] = nil
    redirect_to root_path
  end
end
