require 'sinatra'
require 'sinatra/reloader'
require 'sinatra/json'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection.rb'

# Load models
require_relative 'models/user'
require_relative 'models/movie'

# Load specific routes / controllers
require_relative 'controllers/users'
require_relative 'controllers/movies'

require 'sinatra'

configure do
  enable :sessions
end

helpers do
  def admin?
    session[:admin]
  end
end

get "/users" do
  json User.all
end

get '/public' do
  "This is the public page - everybody is welcome!"
end

get '/private' do
  halt(401,'Not Authorized') unless admin?
  "This is the private page - members only"
end

get '/login' do
  session[:admin] = true
  "You are now logged in"
end

get '/logout' do
  session[:admin] = nil
  "You are now logged out"
end


####################
#  General routes  #
####################
get '/' do
    erb :home
end




#
# get '/'
#   File.read('index.html')
# end
