import 'package:flutter/material.dart';
import 'package:movies_appp/Theme/myTheme.dart';
import 'package:movies_appp/api/api_manager.dart';
import 'package:movies_appp/HomeScreenDetail/MovieDetailScreen.dart';
import 'package:movies_appp/models/category_response.dart';

class NewRelease extends StatefulWidget {
  const NewRelease({super.key});

  @override
  _NewReleaseState createState() => _NewReleaseState();
}

class _NewReleaseState extends State<NewRelease> {
  late Future<List<Movie>> newReleaseMovies;

  @override
  void initState() {
    super.initState();
    newReleaseMovies = ApiManager.getUpcomingMovies();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(10),
      height: screenSize.height * 0.35,
      width: double.infinity,
      color: MyTheme.greyDarkColor,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "New Releases",
            style: Theme.of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: FutureBuilder<List<Movie>>(
              future: newReleaseMovies,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Something went wrong!",
                          style: Theme.of(context).textTheme.titleMedium,
                        ),
                        ElevatedButton(
                          onPressed: () {
                            setState(() {
                              newReleaseMovies = ApiManager.getUpcomingMovies();
                            });
                          },
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Theme.of(context).primaryColor),
                          child: Text(
                            "Try again",
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        )
                      ],
                    ),
                  );
                } else if (snapshot.hasData) {
                  // If data is available, display the ListView of movie items
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: snapshot.data?.length ?? 0, // Movie count from API
                    itemBuilder: (context, index) {
                      Movie movie = snapshot.data![index]; // Movie data from API

                      // Handle null poster path
                      String fullImagePath = movie.posterPath != null
                          ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
                          : 'https://via.placeholder.com/150'; // Fallback placeholder image

                      return MovieItem(
                        imagePath: fullImagePath, // Use the full image URL
                        width: screenSize.width * 0.25,
                        height: screenSize.height * 0.17,
                        onPressedBookmarkIcon: (movieId) {
                          // Placeholder for the bookmark action
                        },
                      );
                    },
                  );
                } else {
                  // If loading, show a loading spinner
                  return const Center(child: CircularProgressIndicator());
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}

// MovieItem widget now displays an image
class MovieItem extends StatelessWidget {
  final String imagePath; // Full URL for the movie image
  final double height;
  final double width;
  final Function(String) onPressedBookmarkIcon;

  const MovieItem({
    required this.imagePath,
    required this.height,
    required this.width,
    required this.onPressedBookmarkIcon,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 8.0),
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.grey[200], // Placeholder background color
      ),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) =>
                  MovieDetailsScreen(
                    // Pass the movie data to the details screen
                    // movie: movie.data!,
                  ),
            ),
          );
        },
        child: ClipRRect(
          borderRadius: BorderRadius.circular(10),
          child: Image.network(
            imagePath, // Display the movie image from the network
            fit: BoxFit.cover, // Ensure the image covers the container
            errorBuilder: (context, error, stackTrace) {
              return const Center(
                child: Icon(
                    Icons.error), // Show error icon if image loading fails
              );
            },
          ),
        ),
      ),
    );
  }
}