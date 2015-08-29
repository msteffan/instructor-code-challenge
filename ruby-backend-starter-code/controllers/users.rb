#

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
post "/users" do
    new_user = User.create(
                name: params[:name])
    # redirect "/users/#{new_user.id}"
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
