import 'package:flutter/material.dart';

class MoreLikeThis extends StatelessWidget {
  final List<String> similarMovies = [
    'Deadpool 2', // Replace with actual movie data
    // Add more movie titles or data
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      padding: const EdgeInsets.all(16.0),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: similarMovies.length,
        itemBuilder: (context, index) {
          return Container(
            width: 120,
            margin: EdgeInsets.symmetric(horizontal: 8.0),
            child: Column(
              children: [
                Image.network(
                  'https://link_to_movie_poster.jpg',
                  // Replace with actual image URL
                  height: 140,
                  fit: BoxFit.cover,
                ),
                SizedBox(height: 8),
                Text(
                  similarMovies[index],
                  style: TextStyle(fontSize: 16),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}