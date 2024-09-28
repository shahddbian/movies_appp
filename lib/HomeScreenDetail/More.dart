import 'package:flutter/material.dart';

class MoreLikeThis extends StatelessWidget {
  final List<Map<String, String>> similarMovies = [
    {
      'poster': 'lib/images/action.jpg',
      'title': 'Movie 1',
      'rating': '7.7',
      'year': '2018',
      'duration': '1h 59m',
    },
    {
      'poster': 'lib/images/animation.jpg',
      'title': 'Movie 2',
      'rating': '7.7',
      'year': '2018',
      'duration': '1h 59m',
    },
    {
      'poster': 'lib/images/drama.jpg',
      'title': 'Movie 3',
      'rating': '7.7',
      'year': '2018',
      'duration': '1h 59m',
    },
    {
      'poster': 'lib/images/history.jpg',
      'title': 'Movie4 2',
      'rating': '7.7',
      'year': '2018',
      'duration': '1h 59m',
    },
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
                // Movie Poster
                Container(
                  height: 140,
                  child: Image.asset(
                    similarMovies[index]['poster']!,
                    fit: BoxFit.cover,
                  ),
                ),
                SizedBox(height: 8),
                Text(
                  similarMovies[index]['title']!,
                  style: TextStyle(fontSize: 14),
                  maxLines: 1,
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