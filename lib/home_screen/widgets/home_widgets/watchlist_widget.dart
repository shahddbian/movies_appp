import 'package:flutter/material.dart';

class WatchlistWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: <Widget>[
        // Watchlist title
        Row(
          children: <Widget>[
            Container(
              margin: EdgeInsets.only(top: 90, left: 10),
              width: 150,
              child: Text(
                'Watchlist',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
        // List of movies (Repeated rows can be made into a widget function)
        buildMovieRow(),
        Divider(color: Colors.white70, thickness: 1, indent: 10, endIndent: 10),
        buildMovieRow(),
        Divider(color: Colors.white70, thickness: 1, indent: 10, endIndent: 10),
        buildMovieRow(),
        Divider(color: Colors.white70, thickness: 1, indent: 10, endIndent: 10),
        buildMovieRow(),
        Divider(color: Colors.white70, thickness: 1, indent: 10, endIndent: 10),
        buildMovieRowWithBorder(),
        Divider(color: Colors.white70, thickness: 1, indent: 10, endIndent: 10),
      ],
    );
  }

  // Helper function to create a movie row
  Widget buildMovieRow() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          margin: EdgeInsets.only(top: 10, left: 10),
          child: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbLSbK0AGmqiMIAMSNaFX8IOkY9ae8T4_BQw&s',
            width: 150,
          ),
        ),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ALITA Battle Angel', style: TextStyle(fontSize: 16, color: Colors.white)),
            Text('2019', style: TextStyle(fontSize: 16, color: Colors.white38)),
            Text('Rose Salazar , Christoph Waltz', style: TextStyle(fontSize: 16, color: Colors.white38)),
          ],
        ),
      ],
    );
  }

  // Helper function to create a movie row with a border
  Widget buildMovieRowWithBorder() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: <Widget>[
        Container(
          decoration: BoxDecoration(
              border: Border.all(color: Colors.black, width: 4),
              borderRadius: BorderRadius.circular(9)
          ),
          margin: EdgeInsets.only(top: 10, left: 10),
          child: Image.network(
            'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQbLSbK0AGmqiMIAMSNaFX8IOkY9ae8T4_BQw&s',
            width: 150,
          ),
        ),
        SizedBox(width: 5),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('ALITA Battle Angel', style: TextStyle(fontSize: 16, color: Colors.white)),
            Text('2019', style: TextStyle(fontSize: 16, color: Colors.white38)),
            Text('Rose Salazar , Christoph Waltz', style: TextStyle(fontSize: 16, color: Colors.white38)),
          ],
        ),
      ],
    );
  }
}
