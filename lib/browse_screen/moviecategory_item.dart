// moviecategory_item.dart
import 'package:flutter/material.dart';
import 'package:movies_appp/api/api_manager.dart';
import 'package:movies_appp/models/movielist_response.dart';
import 'package:movies_appp/models/genres_response.dart';
import 'package:movies_appp/Theme/myTheme.dart';
import 'package:intl/intl.dart';
import 'package:movies_appp/api/api_conatants.dart';

class MovieCategoryItem extends StatefulWidget {
  static const String routeName = "MovieCategoryScreen";

  @override
  State<MovieCategoryItem> createState() => _MoviesByCategoryScreenState();
}

class _MoviesByCategoryScreenState extends State<MovieCategoryItem> {
  @override
  Widget build(BuildContext context) {
    final genre = ModalRoute.of(context)?.settings.arguments as Genres;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          genre.name ?? "",
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: Theme.of(context).textTheme.titleLarge,
        ),
      ),
      body: SafeArea(
        child: FutureBuilder<MovielistResponse>(
          future: ApiManager.discoverMovieByCategoryResponse(pageNo: "1", categoryId: genre.id.toString()),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(color: MyTheme.yellowColor),
              );
            } else if (snapshot.hasError || !snapshot.hasData || snapshot.data!.results == null) {
              print(snapshot.error);
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.error, color: MyTheme.redColor),
                    SizedBox(height: 8),
                    Text('Something went wrong!'),
                    ElevatedButton(
                      onPressed: () {
                        setState(() {});
                      },
                      child: Text('Retry'),
                    ),
                  ],
                ),
              );
            }

            final movies = snapshot.data!.results ?? [];
            if (movies.isEmpty) {
              return Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.movie,
                      size: 100,
                      color: MyTheme.yellowColor,
                    ),
                    SizedBox(height: 8),
                    Text(
                      'No movies available in this category',
                      style: TextStyle(
                        fontSize: 18,
                        color: MyTheme.whiteColor,
                      ),
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              );
            }
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
                return ListTile(
                  leading: movie.posterPath != null
                      ? Image.network(
                    '${Constants.imagePath}${movie.posterPath}',
                    width: 50,
                    fit: BoxFit.cover,
                  )
                      : Image.asset(
                    'lib/images/movies.png',
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                  title: Text(movie.title ?? 'No Title'),
                  subtitle: Text(
                    'Release Date: ${movie.releaseDate != null ? DateFormat('yyyy-MM-dd').format(DateTime.parse(movie.releaseDate!)) : 'Unknown'}',
                  ),
                  onTap: () {
                    // Add navigation to movie details screen
                  },
                );
              },
            );
          },
        ),
      ),
    );
  }
}
