import 'dart:convert';
import 'package:http/http.dart' as http;

class Constants {
  static const String apiKey = 'b7caaa1cf274efcfcbfded77afb87b13';
  static const String baseUrl = "https://api.themoviedb.org/3";
  static const String imagePath = 'https://image.tmdb.org/t/p/w500';

  static const String genreListEndpoint = "/genre/movie/list";
  static const String discoverMovieEndpoint = "/discover/movie";
  static const String popularMoviesEndpoint = "/movie/popular";
  static const String topRatedMoviesEndpoint = "/movie/top_rated";
  static const String upcomingMoviesEndpoint = "/movie/upcoming";
  static const String searchMovieEndpoint = "/search/movie";

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

  static String getSearchMovieUrl(String query) {
    String encodedQuery = Uri.encodeComponent(query);
    return "$baseUrl$searchMovieEndpoint?api_key=$apiKey&query=$encodedQuery";
  }

  static String getDetails(int movieId) {
    return "$baseUrl/movie/$movieId?api_key=$apiKey";
  }
}

Future<List<dynamic>> fetchSearchResults(String query) async {
  if (query.isEmpty) {
    return [];
  }

  try {
    final String searchUrl = Constants.getSearchMovieUrl(query);
    final http.Response response = await http.get(Uri.parse(searchUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse['results'];
    } else {
      throw Exception('Failed to load search results: ${response.reasonPhrase}');
    }
  } catch (e) {
    throw Exception('Error fetching search results: $e');
  }
}

Future<List<dynamic>> fetchPopularMovies() async {
  try {
    final String popularMoviesUrl = Constants.getPopularMoviesUrl();
    final http.Response response = await http.get(Uri.parse(popularMoviesUrl));

    if (response.statusCode == 200) {
      final Map<String, dynamic> jsonResponse = json.decode(response.body);
      return jsonResponse['results'];
    } else {
      throw Exception('Failed to load popular movies: ${response.reasonPhrase}');
    }
  } catch (e) {
    throw Exception('Error fetching popular movies: $e');
  }
}
