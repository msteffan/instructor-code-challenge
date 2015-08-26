get '/movies' do
    @movies = Movie.all
    erb :"movies/index"
end


post "/movies" do
    new_movie = Movie.create(
            title: params[:title]
            # user_id: params[:user_id]
            )
end


#update route
get '/movies/:id/edit' do
    @movie = Movie.find(params[:id])
    erb :"movies/edit"
end

put '/movies/:id' do
    @movie = Movie.find(params[:id])
    @movie.update(params[:movie])
    redirect "/movies/#{@movie.id}"
end

#delete route
delete '/movies/:id' do
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect '/movies'
end
