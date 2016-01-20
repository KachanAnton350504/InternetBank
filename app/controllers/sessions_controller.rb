class SessionsController < ApplicationController
  def new
  end

  def create
     client = Client.find_by(email: params[:session][:email])
    if client && client.authenticate(params[:session][:password])
      sign_in client
      redirect_to client_profile_path(client)
    else
      flash.now[:error] = 'Invalid email/password'
      render 'new'
    end
  end

  def destroy
    sign_out
    redirect_to root_url
  end
end
