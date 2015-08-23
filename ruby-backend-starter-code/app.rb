require 'sinatra'
require 'sinatra/reloader'
require 'active_record'

# Load the file to connect to the DB
require_relative 'db/connection.rb'

# Load models
require_relative 'models/user'
require_relative 'models/movie'

# Load specific routes / controllers
require_relative 'controllers/users'
require_relative 'controllers/movies'

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
