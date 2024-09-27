import 'package:flutter/material.dart';
import 'package:movies_appp/models/category_response.dart';
class MoviePoster extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute
        .of(context)
        ?.settings
        .arguments as Movie;
    return Stack(
      alignment: Alignment.center,
      children: [
        Image.network(
          'https://image.tmdb.org/t/p/w500${args.posterPath}',
          // Replace with actual image URL

          fit: BoxFit.contain,
        ),
        IconButton(
          icon: Icon(Icons.play_circle_fill, size: 64, color: Colors.white),
          onPressed: () {
            // Play movie
          },
        ),
      ],
    );
  }
}