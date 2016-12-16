#!/usr/bin/ruby

require 'sinatra'
require 'sequel'
require 'json'
require 'pry'

DB = Sequel.sqlite

DB.create_table :items do
  primary_key :id
  String :name
end

items = DB[:items]

get '/' do
  <<-heredoc
    GET /
    GET /items
    PUT /items/ITEM_NAME
    DELETE /items/ITEM_NAME
  heredoc
end

get '/items' do
# returns list of items in pseudo JSON format
  [200, {'Content-Type' => 'application/json'}, items.collect {|i| i[:name]}.to_json]
end

put '/items/:item' do
# adds :item to items collection
  items.insert(:name => params['item'])
end

delete '/items/:item' do
# deletes all items named :item
  if items.where('name = ?', params['item']).any?
    items.where('name = ?', params['item']).delete
    return 200
  end
  404
end

get '/pry' do
  binding.pry
end
