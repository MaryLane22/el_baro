class Purchase < ActiveRecord::Base
belongs_to :user
has_many :purchase_services
has_many :services, through: :purchase_services


validates :user_id, presence: true


end
