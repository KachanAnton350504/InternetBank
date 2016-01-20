class ClientsController < ApplicationController
  def new
    @client = Client.new
  end

  def create
    
    
    @client = Client.new(client_params)
    @client.profit_per_month = params[:profit_per_month]
    @client.role = params[:role]
    @client.profit_currency = params[:profit_currency]
    token = Client.new_remember_token
    @client.remember_token = Client.encrypt(token)

    if @client.save
      sign_in @client
      flash[:success] = 'Welcome to the bank of your dream!'
      redirect_to @client 
    else
      render 'new'
    end
  end

  def show
    @client = Client.find(params[:id])
  end

  def get_credit
  end

  def get_credit_information
  end

  def checkout_credit
  end

  def get_deposit
  end

  def get_deposit_information
  end

  def checkout_deposit
  end

  def client_informaton
  end

  def message
  end

   private

    def client_params
      params.require(:client).permit(:name,:email,:address,:password,:password_confirmation,:profit_per_month,:role,:profit_currency)
    end
end
