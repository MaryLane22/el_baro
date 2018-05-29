class CardTransaction < ActiveRecord::Base

  belongs_to :user


  validates   :nombre_propietario, presence: true
  validates   :nombre_banco, presence: true
  validates   :fecha_vencimiento, presence: true
  validates   :monto, presence: true

  VALID_NUMERO_TARJETA_REGEX = /((?:(?:4\d{3})|(?:5[1-5]\d{2})|6(?:011|5[0-9]{2}))(?:-?|\040?)(?:\d{4}(?:-?|\040?)){3}|(?:3[4,7]\d{2})(?:-?|\040?)\d{6}(?:-?|\040?)\d{5})/


     validates :numero_tarjeta, presence: true,
              length:  {minimum: 16, maximum: 19},
              format: {with: VALID_NUMERO_TARJETA_REGEX}
     validates :codigo, presence: true, length: {minimum: 3, maximum: 3}




  validates :user_id, presence: true
end
