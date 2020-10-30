# frozen_string_literal: true

require './app/models/listings.rb'
require './spec/web_helpers.rb'

describe ListingsManager do
  before (:each) do
    reset_table
  end

  describe '#all' do
    it 'Shows all listings' do
      expected_listings = [{ id: '1', title: 'Ocean View flat', location: 'Southampton', price_per_night: '80', rooms: '2', description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.', provider: 'John Smith' },
                           { id: '2', title: 'Central London house', location: 'London', price_per_night: '120', rooms: '4', description: 'Phasellus tincidunt quam turpis, eget lobortis odio mattis id.', provider: 'John Smith' }]

      listings = ListingsManager.all
      2.times do |each|
        # expect(listing[0, then 1].<an_attribute>).to eq hash_arr[0, then 1][value of key <:key>]
        expect(listings[each].id).to eq expected_listings[each][:id]
        expect(listings[each].title).to eq expected_listings[each][:title]
        expect(listings[each].price).to eq expected_listings[each][:price_per_night]
        expect(listings[each].rooms).to eq expected_listings[each][:rooms]
        expect(listings[each].description).to eq expected_listings[each][:description]
        expect(listings[each].provider).to eq expected_listings[each][:provider]
      end
    end
  end

  describe '#create_listing' do
    it 'method responds to argument' do
      listing = {title: 'Sea Lane flat', location: 'Portsmouth', price_per_night: 40, rooms: 5, description: 'a flat in Portsmouth', provider: 1 }
      return_listing = ListingsManager.create_listing(listing).first
      expect(return_listing.id).to eq '3'
      expect(return_listing.title).to eq 'Sea Lane flat'
      expect(return_listing.location).to eq 'Portsmouth'
      expect(return_listing.price).to eq '40'
      expect(return_listing.rooms).to eq '5'
      expect(return_listing.description).to eq 'a flat in Portsmouth'
      expect(return_listing.provider).to eq '1'
    end
  end


end
