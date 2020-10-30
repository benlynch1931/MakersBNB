# frozen_string_literal: true
require 'pg'
class ListingsManager
  attr_reader :id, :title, :location, :price, :rooms, :description, :provider, :phone_no

  def initialize(id:, title:, location:, price:, rooms:, description:, provider:, phone_no:)
    @id = id
    @title = title
    @location = location
    @price = price
    @rooms = rooms
    @description = description
    @provider = provider
    @phone_no = phone_no
  end

  def self.all
    initialize_database
    result = @@connect.exec('SELECT listings.id, title, location, rooms, price_per_night, description, users.first_name, users.last_name, users.phone_no FROM listings INNER JOIN users ON listings.provider = users.id')
    result.map do |listing|
      ListingsManager.new(id: listing['id'], title: listing['title'], location: listing['location'], price: listing['price_per_night'], rooms: listing['rooms'], description: listing['description'][0..290], provider: "#{listing['first_name']} #{listing['last_name']}", phone_no: listing['phone_no'])
    end
  end

  def self.create_listing(listing)
    initialize_database
    result = @@connect.exec("INSERT INTO listings (title, location, price_per_night, rooms, description, provider) VALUES('#{listing[:title]}', '#{listing[:location]}', #{listing[:price_per_night]}, #{listing[:rooms]}, '#{listing[:description]}', #{listing[:provider]}) RETURNING id, title, price_per_night, location, rooms, description, provider")
    result.map do |listing|
      ListingsManager.new(id: listing['id'], title: listing['title'], location: listing['location'], price: listing['price_per_night'], rooms: listing['rooms'], description: listing['description'], provider: listing['provider'])
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
