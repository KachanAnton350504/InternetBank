class DepositType < ActiveRecord::Base
  has_one :currency
  belongs_to :deposit
end
