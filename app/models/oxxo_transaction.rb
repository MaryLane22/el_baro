class OxxoTransaction < ActiveRecord::Base

  belongs_to :user

  validates :user_id, presence: true
  validates :codigo_emitido, presence: true,
  length:  {minimum: 10, maximum: 10}



end
