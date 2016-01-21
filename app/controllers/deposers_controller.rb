class DeposersController < ApplicationController
  include ClientsHelper
  def index
    @deposer = Deposer.first
    @queries = @deposer.deposit_queries
  end

  def information
    @query = DepositQuery.find(params[:id])
  end

  def accept
    @query = DepositQuery.find(params[:id])
    if params[:acceptance] == 'yes'
    bank = TheBank.find(1)    
    client_curr = @query.client
    case @query.deposit_type.currency
      when 'RUB'
        client_curr.bill_rus -= @query.sum
        bank.money_rus += @query.sum
      when 'BYR'
        client_curr.bill_bel -= @query.sum
        bank.money_bel += @query.sum
      when 'EUR'
        client_curr.bill_euro -= @query.sum
        bank.money_euro += @query.sum
      when 'USD'
        client_curr.bill.dollars -= @query.sum
        bank.money_dollars += @query.sum
    end 
    client_curr.save
    bank.save
    deposit = Deposit.new :data_begin => DateTime.now, :sum => @query.sum, :deposit_type_id => @query.deposit_type.id, :client_id => @query.client.id
    deposit.save
    add_message("Your query for #{@query.deposit_type.kind} was accepted.", @query.client.id)
    else if params[:acceptance] == 'no'
      add_message("Unfortunately, your query for #{@query.deposit_type.kind} was rejected. Nothing personal %)", @query.client.id)
    end
    end
    @query.destroy
    redirect_to client_profile_path(@query.client.id)
  end
end
