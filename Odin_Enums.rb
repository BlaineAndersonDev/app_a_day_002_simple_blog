# friends = ['Kelli', 'Justin', 'Chris', 'Andy', 'Donut', 'Ford', 'Deimos']
# hash_of_friends = {'Kelli' => "Female", 'Justin' => "Male", 'Chris' => "Male", 'Andy' => "Male", 'Donut' => "Female", 'Ford' => "Female", 'Deimos' => "Male"}

# # .each - Single Line
#   friends.each { |friend| puts "Hello, " + friend }
#   puts "------------------------------"

# # .each - Multi-Line + Single Variable
#   friends.each do |friend|
#     puts "Hello, " + friend 
#   end
#   puts "------------------------------"

# # .each - Single Line + Index
#   friends.each_with_index { |friend, index| puts friend if index.even? }
#   puts "------------------------------"


#   # .each allows us to do something USING the array.
#   # .map allows us to create a NEW array while altering it.
#   # .select allows us to create a NEW array while altering it.

# # .map - Single Line
#   friends.map { |friend| puts friend.upcase }
#   puts "------------------------------"

# # .map + .gsub - Single Line
#   friends.map { |friend| puts friend.gsub('Deimos', 'Greasy') }
#   puts "------------------------------"

#   # The #select method (also called #filter) passes every item in an array to a block and returns a new array with only the items for which the condition you set in the block evaluated to true.

#   puts friends.select { |friend| friend != 'Deimos' }
#   puts "------------------------------"

#   puts hash_of_friends.select { |friend, gender| gender == "Female" }
#   puts "------------------------------"

# # The #reduce method (also called #inject) reduces an array or hash down to a single object. 
# # You should use #reduce when you want to get an output of a single value.

# #A classic example of when #reduce is useful is obtaining the sum of an array of numbers. 
# # The .each version:

#   my_numbers = [5, 6, 7, 8]
#   sum = 0
#   my_numbers.each { |number| sum += number }
#   puts sum
#   puts "------------------------------"

# # The .reduce version:
#   # my_numbers.reduce { |<accumulator>, <iteration>| <accumulator> + <iteration> }
#   puts my_numbers.reduce { |total, num| total + num }
#   puts "------------------------------"

#   # my_numbers.reduce(<initial_accumulator_value>) { |<accumulator>, <iteration>| <accumulator> + <iteration> }
#   puts my_numbers.reduce(1000) { |total, num| total + num }
#   puts "------------------------------"

#   votes = ["Bob's Dirty Burger Shack", "St. Mark's Bistro", "Bob's Dirty Burger Shack"]

#   votes.reduce(Hash.new(0)) do |result, vote|
#     result[vote] += 1
#     result
#   end

  puts "+++++++++++++++++++++++++++++++"
friends = ['Kelli', 'Justin', 'Chris', 'Andy', 'Donut', 'Ford', 'Deimos']
hash_of_friends = {'Kelli' => "Female", 'Justin' => "Male", 'Chris' => "Male", 'Andy' => "Male", 'Donut' => "Female", 'Ford' => "Female", 'Deimos' => "Male"}

def invited_friends(friends, name)
  friends.select { |friend| friend != name}
end

def upcased_friends(friends)
  friends.map { |friend| friend.upcase}
end

# puts invited_friends(friends, "Deimos")
# puts "+++++++++++++++++++++++++++++++"






# .each is the most common way for Rubyists to handle iteration.
puts "+++++++++++++++++++++++++++++++"
def each_menthod_one(array)
  for name in array
    puts name
  end
end
each_menthod_one(friends)

puts "+++++++++++++++++++++++++++++++"
def each_menthod_two(array)
  array.each do |name|
    puts name
  end
end
each_menthod_two(friends)

puts "+++++++++++++++++++++++++++++++"
def each_menthod_three(array)
  array.each { |name| puts name }
end
each_menthod_three(friends)

puts "+++++++++++++++++++++++++++++++"
# .collect allows you to loop over objects and add the return value of each loop to an array.
def collect_method(array)
  puts array.collect { |name| name.upcase }
end
collect_method(friends)

puts "+++++++++++++++++++++++++++++++"
# .select allows you loop over a collection and return a list of objects for which a particular expression returns true. 
def select_method(array, kick_from_dnd)
  puts array.select { |name| name != kick_from_dnd }
end
select_method(friends, "Deimos")

puts "+++++++++++++++++++++++++++++++"
# .refect will leave behind any objects for which the expression returns true, and add only those that return false to the resulting array.
def reject_method(array, keep_for_dnd)
  puts array.select { |name| name != keep_for_dnd }
end
reject_method(friends, "Deimos")

puts "+++++++++++++++++++++++++++++++"
# .detect method (also implemented as #find) is similar to #select, but instead of returning a collection of objects that match the given criteria, it will “detect” the first matching element it finds and return only that object.
def detect_method(array, detectable_name)
  puts array.detect { |name| name == detectable_name }
end

puts "+++++++++++++++++++++++++++++++"
# .inject method is often used to sum up numbers into a total but can also be used to build up data structures.
cart  = [
  { name: "Ribs", price: 12.00 },
  { name: "Potatos", price: 3.00 },
  { name: "Broccoli", price: 5.00 }
]
def inject_adding_method(hash)
  puts hash.inject(0) { |total, item| total + item[:price] }
end
inject_adding_method(cart)

puts "+++++++++++++++++++++++++++++++"
# .any? returns true if any element in the collection match the given expression.
def any_method(array, any_check)
  puts array.any? { |name| name == any_check }
end
any_method(friends, "Justin")

puts "+++++++++++++++++++++++++++++++"
# .all? returns true if all elements in the collection match the given expression.
def all_method(array, all_check)
  puts array.all? { |name| name == all_check }
end
any_metall_method(friends, "Justin")


