require 'sinatra/base'

class MakersBNBManager < Sinatra::Base

  set :root, File.dirname(__FILE__)
  set :views, File.expand_path('../views', __dir__)
  set :public_folder, File.expand_path('../public', __dir__)

get '/' do
  erb(:index)
end

get '/listings' do
@property = ["House 1","A house for rent","London","£50", 2]
  erb(:listings)
end

# index page => listing page
#
# get '/' do
# erb index
# end
#
# get /all_listings
# page with all properties
# variable = ["property", "price per night"]
# end




run! if app_file == $0

end
