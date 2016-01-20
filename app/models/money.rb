class Money < ActiveRecord::Base
  has_one :currency
end
