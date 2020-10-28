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
    initalize_database
    result = @@connect.exec('SELECT * FROM listings')
    result.map do |listing|
      ListingsManager.new(id: listing['id'], title: listing['title'], location: listing['location'], price: listing['price_per_night'], rooms: listing['rooms'], description: listing['description'])
    end
  end

  private

  def self.initalize_database
    if ENV['ENVIRONMENT'] == 'test'
      @@connect =  PG.connect(dbname: 'makers_bnb_manager_test')
    else
      @@connect =  PG.connect(dbname: 'makers_bnb_manager')
    end
  end
end
