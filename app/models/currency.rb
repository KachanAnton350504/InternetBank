class Currency < ActiveRecord::Base
  has_many :credit_types
end
