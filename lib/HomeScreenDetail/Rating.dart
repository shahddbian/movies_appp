import 'package:flutter/material.dart';
import 'package:movies_appp/models/category_response.dart';

class MovieRating extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute
        .of(context)
        ?.settings
        .arguments as Movie;

    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Row(
        children: [
          Icon(Icons.star, color: Colors.amber),
          SizedBox(width: 4),
          Text(args.voteAverage.toString(),
              style: TextStyle(fontSize: 18, color: Colors.white)),
        ],
      ),
    );
  }
}