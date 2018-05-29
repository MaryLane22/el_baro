class PurchaseService < ActiveRecord::Base
  belongs_to :purchase
  belongs_to :service

end
