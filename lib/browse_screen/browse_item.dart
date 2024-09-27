// browse_item.dart
import 'package:flutter/material.dart';
import 'package:movies_appp/models/genres_response.dart';
import 'package:movies_appp/browse_screen/moviecategory_item.dart';

final Map<int, String> genreImages = {
  28: 'lib/images/action.jpg',
  12: 'lib/images/adventure.jpg',
  16: 'lib/images/animation.jpg',
  35: 'lib/images/comedy.jpg',
  80: 'lib/images/crime.jpg',
  99: 'lib/images/documentary.jpg',
  18: 'lib/images/drama.jpg',
  10751: 'lib/images/family.jpg',
  14: 'lib/images/fantasy.jpg',
  36: 'lib/images/history.jpg',
  27: 'lib/images/horror.jpg',
  10402: 'lib/images/music.jpg',
  9648: 'lib/images/mystery.jpg',
  10749: 'lib/images/romance.jpg',
  878: 'lib/images/sci-fi.jpg',
  10770: 'lib/images/tv.jpg',
  53: 'lib/images/thriller.jpg',
  10752: 'lib/images/war.jpg',
  37: 'lib/images/western.jpg',
};

class BrowseItem extends StatelessWidget {
  final Genres genre;

  BrowseItem({required this.genre});

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return InkWell(
      onTap: () {
        Navigator.pushNamed(context, MovieCategoryItem.routeName, arguments: genre);
      },
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.asset(
              genreImages[genre.id] ?? 'lib/images/movies.png',
              width: screenSize.width * .40,
              height: screenSize.height * .18,
              fit: BoxFit.fill,
            ),
          ),
          SizedBox(height: 8),
          Text(
            genre.name ?? "",
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold),
          ),
        ],
      ),
    );
  }
}
