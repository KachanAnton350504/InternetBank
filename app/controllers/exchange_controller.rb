class ExchangeController < ApplicationController
  def clients_bill_exchange
    @client = Client.find(params[:id])
    
  end

  def apply
    client = Client.find(params[:client_id])
    sum = params[:sum].to_i
    from_currency = params[:from_currency]
    to_currency = params[:to_currency]
    data = YahooFinance::Client.new.quotes(["BVSP", "NATU3.SA", from_currency + to_currency + "=X"], [:ask])
    @rate = data[2].ask.to_i
    is_done = false
    case from_currency
      when 'RUB'
        if client.bill_rus >= sum
          client.bill_rus -= sum
          is_done = true
        end
      when 'BYR'
        if client.bill_bel >= sum
          client.bill_bel -= sum
          is_done = true
        end
      when 'EUR'
        if client.bill_euro >= sum
          client.bill_euro -= sum
          is_done = true
        end
      when 'USD'
        if client.bill_dollars >= sum
          client.bill_dollars -= sum
          is_done = true
        end
    end
    
    if is_done
      converted_sum = @rate * sum
    else
      converted_sum = 0
    end

    case to_currency
      when 'RUB'
        client.bill_rus += converted_sum
      when 'BYR'
        client.bill_bel += converted_sum
      when 'EUR'
        client.bill_euro += converted_sum
      when 'USD'
        client.bill_dollars += converted_sum
    end

    client.save
     redirect_to :action => "clients_bill_exchange", :id => client.id
  end
end
