# frozen_string_literal: true
require 'sinatra/base'
require './app/models/listings.rb'

class MakersBNBManager < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :views, File.expand_path('../views', __dir__)
  set :public_folder, File.expand_path('../public', __dir__)

get '/' do
  erb(:index)
end

get '/listings' do
@property = ListingsManager.all
  erb(:listings)
end

get '/listings/new' do
  erb(:create_listings)
end

post '/listings' do
  listing = {title: params[:title], location: params[:location], price_per_night: params[:price], rooms: params[:rooms], description: params[:description]}
  ListingsManager.create_listing(listing)
  redirect '/listings'
end

run! if app_file == $0

end
