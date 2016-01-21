class Deposit < ActiveRecord::Base
  has_one :credit_type
  belongs_to :client
end
