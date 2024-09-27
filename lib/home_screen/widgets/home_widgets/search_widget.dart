import 'package:flutter/material.dart';

class SearchWidget extends StatelessWidget {
  final TextEditingController searchController;
  final bool isLoading;
  final List<dynamic> searchResults;

  const SearchWidget({
    required this.searchController,
    required this.isLoading,
    required this.searchResults,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: searchController,
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintText: 'Search for a movie...',
              hintStyle: TextStyle(color: Colors.white54),
              filled: true,
              fillColor: Colors.black,
              prefixIcon: Icon(Icons.search, color: Colors.white),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: BorderSide.none,
              ),
            ),
          ),
        ),
        if (isLoading) CircularProgressIndicator(),
        Expanded(
          child: searchResults.isNotEmpty
              ? ListView.builder(
            itemCount: searchResults.length,
            itemBuilder: (context, index) {
              final movie = searchResults[index];
              final title = movie['title'] ?? 'No title';
              final releaseDate = movie['release_date'] ?? 'Unknown';
              final posterUrl = movie['poster_path'] != null
                  ? 'https://image.tmdb.org/t/p/w500${movie['poster_path']}'
                  : 'https://via.placeholder.com/150';

              return ListTile(
                leading: Image.network(posterUrl, width: 50),
                title: Text(title, style: TextStyle(color: Colors.white)),
                subtitle: Text('Release Date: $releaseDate', style: TextStyle(color: Colors.white54)),
              );
            },
          )
              : Center(
            child: Text(
              'No results found. Start typing to search for a movie...',
              style: TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
        ),
      ],
    );
  }
}

