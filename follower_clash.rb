require 'rubygems'
require 'bundler/setup'
require 'foreman'
require_relative 'lib/user_comparer'

user1 = UserComparer::User.new('ornellasmike')
user2 = UserComparer::User.new('techpeace')
comparer = UserComparer::Comparer.new(user1, user2)


puts "#{user1.username}'s follower count: #{user1.followers}"
puts "#{user2.username}'s follower count: #{user2.followers}"
puts "And the user with the most followers is: #{comparer.compare_followers}"

puts "____________________________________"

puts "#{user1.username}'s friend count: #{user1.friends}"
puts "#{user2.username}'s friend count: #{user2.friends}"
puts "And the user with the most friends is: #{comparer.compare_friends}"