# frozen_string_literal: true
require 'pg'
class ListingsManager
  attr_reader :id, :title, :location, :price, :rooms, :description

  def initialize(id:, title:, location:, price:, rooms:, description:)
    @id = id
    @title = title
    @location = location
    @price = price
    @rooms = rooms
    @description = description
  end

  def self.all
    initialize_database
    result = @@connect.exec('SELECT * FROM listings')
    result.map do |listing|
      ListingsManager.new(id: listing['id'], title: listing['title'], location: listing['location'], price: listing['price_per_night'], rooms: listing['rooms'], description: listing['description'])
    end
  end

  def self.create_listing(listing)
    initialize_database
    result = @@connect.exec("INSERT INTO listings (title, location, price_per_night, rooms, description) VALUES('#{listing[:title]}', '#{listing[:location]}', #{listing[:price_per_night]}, #{listing[:rooms]}, '#{listing[:description]}') RETURNING id, title, price_per_night, location, rooms, description")
    result.map do |listing|
      ListingsManager.new(id: listing['id'], title: listing['title'], location: listing['location'], price: listing['price_per_night'], rooms: listing['rooms'], description: listing['description'])
    end
  end

  private

  def self.initialize_database
    @@connect = if ENV['ENVIRONMENT'] == 'test'
                  PG.connect(dbname: 'makers_bnb_manager_test')
                else
                  PG.connect(dbname: 'makers_bnb_manager')
                end

  end
end
