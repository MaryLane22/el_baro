class Service < ActiveRecord::Base
    has_many :purchase_services
    has_many :purchases, through: :purchase_services


    validates :nombre, presence: true, length: { minimum: 3, maximum: 50 }
    validates_uniqueness_of :nombre
    validates :precio, presence: true
end
