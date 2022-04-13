require_relative '../setup'
require_relative './exercise_1'
require_relative './exercise_2'
require_relative './exercise_3'
require_relative './exercise_4'
require_relative './exercise_5'
require_relative './exercise_6'

# require 'byebug'

puts "Exercise 7"
puts "----------"


#1 Add validations to two models to enforce the following business rules:
#Employees must always have a first name present
#Employees must always have a last name present

#Employees have a hourly_rate that is a number (integer) between 40 and 200
#Employees must always have a store that they belong to (can't have an employee that is not assigned a store)

# Stores must always have a name that is a minimum of 3 characters
# Stores have an annual_revenue that is a number (integer) that must be 0 or more

# BONUS: Stores must carry at least one of the men's or women's apparel (hint: use a custom validation method - don't use a Validator class)
#2  Ask the user for a store name (store it in a variable)

#3 Attempt to create a store with the inputted name but leave out the other fields (annual_revenue, mens_apparel, and womens_apparel)
#4 Display the error messages provided back from ActiveRecord to the user (one on each line) after you attempt to save/create the record

# Your code goes here ...

@employees = Employee.where('hourly_rate > ? or hourly_rate < ?',  40, 200)
#Store.joins(:employees)
@employees.each do |employee|
  puts "#{employee.first_name} hourly rate: #{employee.hourly_rate}"
  puts "employee store? #{employee.store.name}"
end
###Get the store name from the employee.
emp = @employees.first
@storename = emp.store.name
puts "storeName:" + @storename

store3 = Store.create(name: @storename)
puts "store3.name: " + store3.name

puts "store3.errors.count: #{store3.errors.count}"
store3.errors.full_messages.each do |message|
  puts message
end

store4 = Store.create(name: "Calgary")
puts "store4.name: " + store4.name

store4.errors.full_messages.each do |message|
  puts message
end