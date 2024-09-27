import 'package:flutter/material.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_appp/api/api_manager.dart';
import 'package:movies_appp/HomeScreenDetail/MovieDetailScreen.dart';
import 'package:movies_appp/models/category_response.dart';

class PopularSlider extends StatefulWidget {
  const PopularSlider({super.key});

  @override
  State<PopularSlider> createState() => _PopularSliderState();
}

class _PopularSliderState extends State<PopularSlider> {
  late Future<List<Movie>> popularMovies;

  @override
  void initState() {
    super.initState();
    popularMovies = ApiManager.getPopularMovies(); // Fetch popular movies
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return SizedBox(
      width: double.infinity,
      height: screenSize.height * 0.35,
      child: FutureBuilder<List<Movie>>(
        future: popularMovies,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text("Something went wrong!"),
            );
          } else if (snapshot.hasData) {
            return CarouselSlider.builder(
              itemCount: snapshot.data?.length ?? 0,
              itemBuilder: (context, index, realIndex) {
                Movie movie = snapshot.data![index]; // Movie data from API

                // Handle null poster path
                String fullImagePath = movie.posterPath != null
                    ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
                    : 'https://via.placeholder.com/150'; // Fallback placeholder image

                return MovieItem(
                  imagePath: fullImagePath, // Use the full image URL
                  width: screenSize.width * 0.70,
                  height: screenSize.height * 0.35,
                );
              },
              options: CarouselOptions(
                autoPlay: true,
                height: screenSize.height * 0.35,
                enlargeCenterPage: true,
                pageSnapping: true,
                viewportFraction: 0.55,
                autoPlayCurve: Curves.fastOutSlowIn,
                autoPlayAnimationDuration: const Duration(seconds: 1),
              ),
            );
          } else {
            // Loading state
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}

// MovieItem widget to display only the movie image
class MovieItem extends StatelessWidget {
  final String imagePath; // Full URL for the movie image
  final double height;
  final double width;

  const MovieItem({
    required this.imagePath,
    required this.height,
    required this.width,
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
              builder: (context) => MovieDetailsScreen(
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
                child: Icon(Icons.error), // Show error icon if image loading fails
              );
            },
          ),
        ),
      ),
    );
  }
}