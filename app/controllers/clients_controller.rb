class ClientsController < ApplicationController
  include ClientsHelper
  
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    @client.profit_per_month = params[:profit_per_month]
    @client.role = 2;
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
    @bank = TheBank.first
  end

  def get_credit
  end

  def get_credit_information
  end

  def checkout_credit
  end

  def get_deposit
    @deposits = DepositType.all
  end

  def get_deposit_information
    @deposit_type = DepositType.find(params[:id])
  end

  def checkout_deposit
    @deposit_type = DepositType.find(params[:id])
    @deposit_query = DepositQuery.new
  end

  def query_deposit 
    @deposit_query = DepositQuery.create :sum => params[:sum], :deposit_type_id => params[:deposit_type_id], :client_id => params[:client_id], :deposer_id => 1
    add_message("Your query for #{DepositType.find(params[:deposit_type_id]).kind} by #{DateTime.now} is not declyned yet!", params[:client_id])
    redirect_to client_profile_path(params[:client_id])
  end

  def client_deposit_information
    @client = Client.find(params[:client_id])
    @deposit = Deposit.find(params[:deposit_id])
    make_things_deposit(@client, @deposit)
  end

  def client_information
    @client = Client.find(params[:id])
    # @client.credits.each do |c|
    #   make_things_credit(@client,c)
    # end

    @client.deposits.each do |d|
      make_things_deposit(@client,d)
    end
  end
  
  def messages
    @messages = current_client.client_messages
  end

  def delete_message
    message = ClientMessage.find(params[:id])
    message.destroy
    redirect_to client_messages_path
  end

  def bank_information
    @bank = TheBank.first
  end


   private

    def client_params
      params.require(:client).permit(:name,:email,:address,:password,:password_confirmation,:profit_per_month,:role,:profit_currency)
    end
    
    def month_difference(created,updated)
      (created.hour * 60 + created.min) - (updated.hour * 60 + updated.min).floor
    end

    def make_things_deposit(client_id, deposit_id)
      client = Client.find(client_id)
      deposit = Deposit.find(deposit_id)
      deposit_type = DepositType.find(deposit.deposit_type_id)
      @deposit_type = deposit_type
      bank = TheBank.find(1)
      time_diff = month_difference(deposit.created_at, DateTime.now)
      if (deposit.updated_at.min != DateTime.now.min)
        month_add = deposit.sum * deposit_type.percent * deposit_type.deposit_duration
        sum = month_add.to_f / (1200 * deposit_type.deposit_duration)
        case deposit_type.currency
        when 'RUB'
          bank.money_rus -= sum
          client.bill_rus += sum
        when 'BYR'
          bank.money_bel -= sum
          client.bill_bel += sum
        when 'EUR'
          bank.money_euro -= sum
          client.bill_euro += sum
        when 'USD'
          bank.money_dollars -= sum
          client.bill_dollars += sum
        end   
      end

      deposit.touch
      if ((DateTime.now.hour*60 + DateTime.now.min) - ((deposit.created_at.hour)* 60 + deposit.created_at.min) >= deposit_type.deposit_duration)
        add_message("Deposit #{deposit_type.kind} was successfully finished. Thank you, #{client.name}", client.id)
        case deposit_type.currency
        when 'RUB'
          bank.money_rus -= deposit.sum
          client.bill_rus += deposit.sum
        when 'BYR'
          bank.money_bel -= deposit.sum
          client.bill_bel += deposit.sum
        when 'EUR'
          bank.money_euro -= deposit.sum
          client.bill_euro += deposit.sum
        when 'USD'
          bank.money_dollars -= deposit.sum
          client.bill_dollars += deposit.sum
        end
        
        deposit.destroy
        redirect_to @client
      end
      bank.save
      client.save
      
    end

end
