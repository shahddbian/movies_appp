import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:movies_appp/models/MovieDetailResponse.dart';
import 'package:movies_appp/api/api_conatants.dart';
import 'package:movies_appp/models/movielist_response.dart';
import 'package:movies_appp/models/genres_response.dart';
import 'package:movies_appp/models/category_response.dart';

class ApiManager {
  static const popularUrl =
      "https://api.themoviedb.org/3/movie/popular?api_key=${Constants.apiKey}";
  static const topRatedUrl =
      'https://api.themoviedb.org/3/movie/top_rated?api_key=${Constants.apiKey}';
  static const upcomingUrl =
      'https://api.themoviedb.org/3/movie/upcoming?api_key=${Constants.apiKey}';
  static const genreUrl =
      'https://api.themoviedb.org/3/genre/movie/list?api_key=${Constants.apiKey}&language=en-US';

  static Future<List<Movie>> getPopularMovies() async {
    final response = await http.get(Uri.parse(popularUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load popular movies');
    }
  }

  static Future<List<Movie>> getTopRatedMovies() async {
    final response = await http.get(Uri.parse(topRatedUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load top rated movies');
    }
  }

  static Future<List<Movie>> getUpcomingMovies() async {
    final response = await http.get(Uri.parse(upcomingUrl));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body)['results'] as List;
      return decodedData.map((movie) => Movie.fromJson(movie)).toList();
    } else {
      throw Exception('Failed to load upcoming movies');
    }
  }

  static Future<GenresResponse> getCategoryResponse() async {
    final response = await http.get(Uri.parse(genreUrl));
    print("Fetching genres: ${response.request?.url}");
    if (response.statusCode == 200) {
      print("Genres fetched successfully.");
      return GenresResponse.fromJson(json.decode(response.body));
    } else {
      print("Failed to fetch genres with status code: ${response.statusCode}");
      throw Exception('Failed to load genres');
    }
  }

  static Future<MovielistResponse> discoverMovieByCategoryResponse({
    required String pageNo,
    required String categoryId,
  }) async {
    final String url = Constants.getDiscoverMovieUrl(genreId: categoryId, pageNo: pageNo);
    final response = await http.get(Uri.parse(url));
    print("Fetching movies for genre $categoryId: $url");
    if (response.statusCode == 200) {
      print("Movies fetched successfully for genre $categoryId.");
      return MovielistResponse.fromJson(json.decode(response.body));
    } else {
      print("Failed to fetch movies with status code: ${response.statusCode}");
      throw Exception('Failed to load movies by category');
    }
  }

  static Future<MovieDetailResponse> getMovieDetails(int id) async {
    Uri url = Uri.https('api.themoviedb.org', Constants.getDetails(id),
        {"api_key": Constants.apiKey, "language": "en-US"});
    print(url);
    try {
      var response = await http.get(url);
      var bodyString = response.body;
      var json = jsonDecode(bodyString);
      return MovieDetailResponse.fromJson(json);
    } catch (e) {
      print(e);
      throw e;
    }
  }

  static Future<List<dynamic>> fetchSearchResults(String query) async {
    if (query.isEmpty) {
      return [];
    }

    final String searchUrl = Constants.getSearchMovieUrl(query);
    print("Searching movies: $searchUrl");

    final response = await http.get(Uri.parse(searchUrl));
    if (response.statusCode == 200) {
      final jsonResponse = json.decode(response.body);
      return jsonResponse['results'];
    } else {
      print("Failed to fetch search results with status code: ${response.statusCode}");
      throw Exception('Failed to load search results');
    }
  }
}

