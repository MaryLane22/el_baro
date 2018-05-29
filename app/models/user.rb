class User < ActiveRecord::Base

  has_many :card_transactions
  has_many :oxxo_transactions

  validates :nocontrol, presence: true
  validates :nombre, presence:true,length: {minimum: 15, maximum: 50}
  validates :usuario, presence: true,uniqueness: {case_sensitive: false},
            length: {minimum: 3, maximum: 25}
  validates :password, presence:true,length: {minimum: 3, maximum: 50}
  validates :carrera, presence:true,length: {minimum: 3, maximum: 50}
  validates :semestre, presence:true

has_secure_password


end
