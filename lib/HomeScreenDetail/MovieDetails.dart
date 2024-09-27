import 'package:flutter/material.dart';
import 'package:movies_appp/models/category_response.dart';

class MovieDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var args = ModalRoute.of(context)?.settings.arguments as Movie;
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            args.title ?? '',
            style: TextStyle(
                fontSize: 24, fontWeight: FontWeight.bold, color: Colors.white),
          ),
          SizedBox(height: 8),
          Row(
            children: [
              Text(
                args.releaseDate.toString(),
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          SizedBox(height: 8),
          Wrap(
            spacing: 8.0,
            children: [
              Chip(label: Text('Action')),
              Chip(label: Text('Adventure')),
              Chip(label: Text('Family')),
            ],
          ),
          SizedBox(height: 16),
          Text(
            args.overview ?? '',
            style: TextStyle(color: Colors.white),
          ),
        ],
      ),
    );
  }
}