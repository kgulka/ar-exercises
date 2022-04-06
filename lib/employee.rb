class Employee < ActiveRecord::Base
  belongs_to :stores
  validates :first_name, :last_name, :store_id, presence: true

  validates :store_id, presence: true

  validates :hourly_rate, numericality: { only_integer: true, greater_than: 40, less_than: 200 }

end

