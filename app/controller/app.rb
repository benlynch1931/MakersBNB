# frozen_string_literal: true

require 'sinatra/base'

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

run! if app_file == $0

end
