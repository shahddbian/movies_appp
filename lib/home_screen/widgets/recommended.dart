import 'package:flutter/material.dart';
import 'package:movies_appp/HomeScreenDetail/MovieDetailScreen.dart';
import 'package:movies_appp/Theme/myTheme.dart';
import 'package:movies_appp/api/api_manager.dart';
import 'package:movies_appp/models/category_response.dart';

class Recommended extends StatefulWidget {
  const Recommended({super.key});

  @override
  _RecommendedState createState() => _RecommendedState();
}

class _RecommendedState extends State<Recommended> {
  late Future<List<Movie>> recommendedMovies;

  @override
  void initState() {
    super.initState();
    recommendedMovies = ApiManager.getTopRatedMovies();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery
        .of(context)
        .size;

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
            "Recommended",
            style: Theme
                .of(context)
                .textTheme
                .titleLarge
                ?.copyWith(fontWeight: FontWeight.bold),
          ),
          const SizedBox(height: 10),
          Expanded(
            child: FutureBuilder<List<Movie>>(
              future: recommendedMovies,
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Center(
                    child: Text(
                      "Something went wrong!",
                      style: Theme
                          .of(context)
                          .textTheme
                          .titleMedium,
                    ),
                  );
                } else if (snapshot.connectionState ==
                    ConnectionState.waiting) {
                  return const Center(child: CircularProgressIndicator());
                } else if (snapshot.hasData) {
                  return ListView.builder(
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    itemCount:
                    snapshot.data?.length ?? 0, // Movie count from API
                    itemBuilder: (context, index) {
                      Movie movie =
                      snapshot.data![index]; // Movie data from API

                      // Handle null poster path
                      String fullImagePath = movie.posterPath != null
                          ? 'https://image.tmdb.org/t/p/w500${movie.posterPath}'
                          : 'https://via.placeholder.com/150'; // Fallback placeholder image

                      return InkWell(
                        onTap: () {
                          Navigator.of(context).pushNamed(
                              MovieDetailsScreen.routeName, arguments: movie);
                        },
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Image.network(
                                fullImagePath, // Movie poster image from API
                                fit: BoxFit.cover,
                                width: screenSize.width * 0.25,
                                height: screenSize.height * 0.2,
                                errorBuilder: (context, error, stackTrace) {
                                  return const Center(
                                    child: Icon(Icons
                                        .error), // Show error icon if image loading fails
                                  );
                                },
                              ),
                              const SizedBox(height: 8),
                              Text(
                                movie.title!, // Movie title from API
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodyMedium
                                    ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: MyTheme.whiteColor,
                                ),
                              ),
                              Row(
                                children: [
                                  const Icon(Icons.star,
                                      color: Colors.yellow, size: 18),
                                  const SizedBox(width: 5),
                                  Text(
                                    movie.voteAverage
                                        .toString(), // Movie rating from API
                                    style: Theme
                                        .of(context)
                                        .textTheme
                                        .bodySmall
                                        ?.copyWith(color: MyTheme.whiteColor),
                                  ),
                                ],
                              ),
                              Text(
                                movie.releaseDate != null
                                    ? "${movie.releaseDate!.year}  ${movie
                                    .voteAverage
                                    ?.toString()}" // Movie details (year, rating)
                                    : "No Release Date",
                                style: Theme
                                    .of(context)
                                    .textTheme
                                    .bodySmall
                                    ?.copyWith(color: MyTheme.whiteColor),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  );
                } else {
                  return const Center(child: Text("No data available."));
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}