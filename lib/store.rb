class Store < ActiveRecord::Base
  has_many :employees
  # Stores must always have a name that is a minimum of 3 characters
  validates :name, length: { minimum: 3 }
  # Stores have an annual_revenue that is a number (integer) that must be 0 or more
  validates :annual_revenue, numericality: { only_integer: true, greater_than_or_equal: 0 }
end
