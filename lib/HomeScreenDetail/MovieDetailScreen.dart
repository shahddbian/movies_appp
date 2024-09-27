import 'package:flutter/material.dart';
import 'package:movies_appp/models/category_response.dart';
import 'More.dart';
import 'MovieDetails.dart';
import 'MovieName.dart';
import 'Rating.dart';


class MovieDetailsScreen extends StatelessWidget {
  // Step 1: Add a static constant for the route name
  static const String routeName = 'movie-details';

  // Movie object passed to this screen

  // Constructor to accept the Movie object


  @override
  Widget build(BuildContext context) {
    var args = ModalRoute
        .of(context)
        ?.settings
        .arguments as Movie;
    return Scaffold(
      appBar: AppBar(
        title: Text(args.title ?? 'Movie Details'), // Use movie title
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            MoviePoster(), // Display the movie poster
            MovieDetails(), // Display movie details
            MovieRating(), // Display movie rating
            MoreLikeThis(), // Display more similar movies
          ],
        ),
      ),
    );
  }
}