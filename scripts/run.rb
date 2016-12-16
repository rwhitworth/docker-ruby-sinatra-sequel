#!/usr/bin/ruby

require 'sequel'
require 'pry'

DB = Sequel.sqlite

DB.create_table :items do
  primary_key :id
  String :name
  Float :price
end

items = DB[:items]

items.insert(:name => 'abc', :price => rand * 100)
items.insert(:name => 'def', :price => rand * 100)
items.insert(:name => 'ghi', :price => rand * 100)

items.each {|x| printf "#{x[:name]} - %02.2f\n", x[:price] }

binding.pry
