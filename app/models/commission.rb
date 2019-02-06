class Commission < ApplicationRecord
    belongs_to :customer
    attr_accessor :customer_id
end
