# frozen_string_literal: true
require 'sinatra/base'
require 'sinatra/flash'
require './app/models/listings.rb'
require './app/models/users.rb'

class MakersBNBManager < Sinatra::Base
  set :root, File.dirname(__FILE__)
  set :views, File.expand_path('../views', __dir__)
  set :public_folder, File.expand_path('../public', __dir__)
  enable :sessions
  set :session_secret, "Team Bananas Session"
  register Sinatra::Flash

get '/' do
  erb(:index)
end

get '/listings' do
@property = ListingsManager.all
  erb(:listings)
end

get '/listings/new' do
  if !!session[:id]
    erb(:create_listings)
  else
    flash[:authorize] = "Please log in or sign up first"
    redirect '/session/new'
  end
end

post '/listings' do
  listing = {title: params[:title], location: params[:location], price_per_night: params[:price], rooms: params[:rooms], description: params[:description]}
  ListingsManager.create_listing(listing)
  redirect '/listings'
end

get '/session/new' do
  erb :'session/new'
end

post '/session' do
  user = User.authenticate(email: params[:email], password: params[:password])
  if user
    session[:id] = user.id
    flash[:user] = "Welcome, #{user.first_name} #{user.last_name}"
    redirect '/'
  else
    flash[:notice] = "Please check your email or password."
    redirect '/session/new'
  end
end

get '/users/new' do
  erb :'/users/new'
end

post '/users' do
  if params[:password] == params[:confirm_password]
    User.create(first_name: params[:first_name], last_name: params[:last_name], email: params[:email], phone_no: params[:phone_no], password: params[:password])
    flash[:sign_up] = "Successfully signed up! Please log in using your details."
    redirect '/session/new'
  else
    flash[:password] = "These passwords did not match!"
    redirect "/users/new"
  end
end

run! if app_file == $0

end
