function search(keyword) {
  var url = 'http://www.omdbapi.com/?s='+escape(keyword);

  $.getJSON(url)
  .done(function(imdbResponse){
    // We want to use both the search keyword and the imdb response in imdbDone
    //   We use an anonymous function to pass both.
    imdbDone(keyword, imdbResponse);
  })
  .fail(function(imdbResonse, textStatus, errorMessage){
    var message = "Sorry, we had issues retrieving movie data for '" + keyword + "'";
    if (errorMessage){
      message += "(" + errorMessage + ")";
    }
    message += ".  Please try again.";
    $('#movie-detail').html("<h2 class='fail'>" + message + "</h2>");
  });
}

function imdbDone(searchKeyword, imdbSearchData) {
  var display = '<option value="">Movies matching "'+ searchKeyword +'"...</option>';

  for (var i=0; i < imdbSearchData.Search.length; i++) {
    var movie = imdbSearchData.Search[i];
    display += ['<option value="', movie.imdbID, '">', movie.Title, '</option>'].join('');
  }

  $('#movie-select').show().html(display);
}

function show(imdbId) {
  if (!imdbId) return;

  var url = 'http://www.omdbapi.com/?i='+imdbId;

  $.getJSON(url).then(function(imdbMovieData) {
    var detail = "<h2 class='movieTitle'>" + imdbMovieData.Title + '</h2>';
    detail += '<img src="'+ imdbMovieData.Poster +'" alt="'+ imdbMovieData.Title +'">';
    $('#movie-detail').html(detail);
    $("#movie-detail").append("<button id='addFave'>Add to favorites</button>")
  });

}


// Search form:

$('#search').on('submit', function(evt) {
  evt.preventDefault();
  var $search = $('#movie-search');
  var keyword = $search.val();
  $search.val('');

  search(keyword);
});


// Movie selector:

$('#movie-select').hide().on('change', function() {
  show(this.value);
});



///// back end //////

  // ajax get
$(".test_ajax_get").on("click", function(){
    $.ajax({
      type: 'GET',
      dataType: 'json',
      url: "http://localhost:4567/users"
    }).done(function(response) {
      console.log(response)
    }).fail(function(response){
      console.log("ajax get request failed")
    })
})

  // ajax post
$("body").on("click", "#addFave", function(){
    console.log("clicked");
    var movieTitle = $(".movieTitle").html()
    console.log(movieTitle);
    //var userId =
    // var photoUrl = $(".photo_url").val()
    // var nationality = $(".nationality").val()
    $.ajax({
      type: 'POST',
      data: //{ "movie":
          { "title": movieTitle }
          //,
        //   user_id: userId
        //}
        ,
      dataType: 'json',
      url: "http://localhost:4567/movies"
    }).done(function(response) {
      console.log(response)
    //   $("ul.articles").append("<li><a href='/artists/" + response.id + "'>" + response.name + "</a></li>")
    }).fail(function(response){
        console.log(response);
        $(".fave-list").append("<li>"+ movieTitle +"</li>")
    })
})

  // ajax put
// $(".test_ajax_put").on("click", function(){
//     $.ajax({
//       type: 'PUT',
//       {artist: {photo_url: photoUrl, name: name, nationality: nationality}},
//       dataType: 'json',
//       url: "http://localhost:3000/artists/6"
//     }).done(function(response){
//       console.log(response)
//     }).fail(function(){
//       console.log("failed to update")
//     })
// })
//
//   // ajax delete
// $(".test_ajax_delete").on("click", function(){
//     $.ajax({
//       type: 'DELETE',
//       dataType: 'json',
//       url: "http://localhost:3000/artists/9"
//     }).done(function(response){
//       console.log("DELETED")
//       console.log(response)
//     }).fail(function(){
//       console.log("failed to delete")
//     })
// })
