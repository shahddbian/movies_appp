class Constants {
  static const String apiKey = 'b7caaa1cf274efcfcbfded77afb87b13';
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String imagePath = 'https://image.tmdb.org/t/p/w500';

  static const String genreListEndpoint = "/genre/movie/list";
  static const String discoverMovieEndpoint = "/discover/movie";
  static const String popularMoviesEndpoint = "/movie/popular";
  static const String topRatedMoviesEndpoint = "/movie/top_rated";
  static const String upcomingMoviesEndpoint = "/movie/upcoming";

  static String getGenreListUrl() {
    return "$baseUrl$genreListEndpoint?api_key=$apiKey&language=en-US";
  }

  static String getDiscoverMovieUrl({required String genreId, required String pageNo}) {
    return "$baseUrl$discoverMovieEndpoint?api_key=$apiKey&with_genres=$genreId&page=$pageNo";
  }

  static String getPopularMoviesUrl() {
    return "$baseUrl$popularMoviesEndpoint?api_key=$apiKey";
  }

  static String getTopRatedMoviesUrl() {
    return "$baseUrl$topRatedMoviesEndpoint?api_key=$apiKey";
  }

  static String getUpcomingMoviesUrl() {
    return "$baseUrl$upcomingMoviesEndpoint?api_key=$apiKey";
  }

  static String getDetails(int movieId) {
    return "$baseUrl/3/movie/$movieId?api_key=$apiKey&language=en-US";
  }
}
