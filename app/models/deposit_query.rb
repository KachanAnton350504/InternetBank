class DepositQuery < ActiveRecord::Base
  belongs_to :deposit_type
  belongs_to :client
  belongs_to :deposer
end
