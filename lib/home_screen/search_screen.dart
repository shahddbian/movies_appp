import 'package:flutter/material.dart';
import 'package:movies_appp/home_screen/widgets/home_widgets/search_widget.dart';
import 'package:movies_appp/api/api_manager.dart';
import '../api/api_conatants.dart';
import '../browse_screen/browse_widget.dart';
import 'WatchlistPage.dart';
import 'home_screen.dart';

class SearchScreen extends StatefulWidget {
  static const routeName = 'searchscreen'; // Route name

  @override
  SearchScreenState createState() => SearchScreenState();
}

class SearchScreenState extends State<SearchScreen> {
  int selectedIndex = 1;
  TextEditingController searchController = TextEditingController();
  List<dynamic> searchResults = [];
  bool isLoading = false;

  void onSearchChanged(String query) async {
    if (query.isNotEmpty) {
      setState(() {
        isLoading = true;
      });

      try {
        final results = await fetchSearchResults(query);
        setState(() {
          searchResults = results;
          isLoading = false;
        });
      } catch (e) {
        print('Error searching for movies: $e');
        setState(() {
          isLoading = false;
        });
      }
    } else {
      setState(() {
        searchResults = [];
      });
    }
  }

  @override
  void initState() {
    super.initState();

    searchController.addListener(() {
      onSearchChanged(searchController.text);
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Search')),
      body: SearchWidget(
        searchController: searchController,
        isLoading: isLoading,
        searchResults: searchResults,
      ),
    );
  }
}