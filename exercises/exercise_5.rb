require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'

puts "Exercise 5"
puts "----------"

# Output the total revenue for the entire company (all stores), using Active Record's .sum calculation method.
# On the next line, also output the average annual revenue for all stores.
# Output the number of stores that are generating $1M or more in annual sales. Hint: Chain together where and size (or count) Active Record methods.

# Your code goes here ...

@all_stores = Store.all()
@total_revenue = @all_stores.sum(:annual_revenue)
puts "Total revenue of all stores is: #{@total_revenue}"

@ave_revenue = @all_stores.average(:annual_revenue)
puts "Average annual revenue of all stores is: #{@ave_revenue}"

puts "2All stores over $1M: #{Store.where('annual_revenue < ?',  1000000).count}"