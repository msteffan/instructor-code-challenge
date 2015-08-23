# get 'favorites' do
#   response.header['Content-Type'] = 'application/json'
#   File.read('data.json')
# end
#
# get '/favorites' do
#   file = JSON.parse(File.read('data.json'))
#   unless params[:name] && params[:oid]
#     return 'Invalid Request'
#   movie = { name: params[:name], oid: params[:oid] }
#   file << movie
#   File.write('data.json',JSON.pretty_generate(file))
#   movie.to_json
# end

#show route
get '/users/:id.json' do
    @user = User.find(params[:id])
    json @user
end

get '/users/:id' do
    @user = User.find(params[:id])
    @movies = @user.movies
    erb :"users/show"
end




#new route
# get '/users/new' do
#     erb :"songs/new"
# end

post "/users" do
    new_user = User.create(
                name: params[:name])
    redirect "/users/#{new_user.id}"
end

#update route
get '/users/:id/edit' do
    @user = User.find(params[:id])
    erb :"users/edit"
end

put "/users/:id" do
    @user = User.find(params[:user])
    @user.update(params[:user])
    redirect "/users/#{@user.id}"
end

#delete route
delete "/users/:id" do
    @user = User.find(params[:id])
    @user.destroy
    redirect "/users"
end
