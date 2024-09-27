import 'package:flutter/material.dart';
import 'package:movies_appp/home_screen/widgets/bottom_nav_bar.dart';
import 'package:movies_appp/home_screen/widgets/home_widgets/HomeWidget.dart';
import 'package:movies_appp/home_screen/widgets/home_widgets/search_widget.dart';
import 'package:movies_appp/home_screen/widgets/home_widgets/watchlist_widget.dart';
import 'package:movies_appp/browse_screen/browse_widget.dart';
import 'package:movies_appp/models/category_response.dart';
import 'package:movies_appp/HomeScreenDetail/MovieDetailScreen.dart';

class HomeScreen extends StatefulWidget {
  static const String routeName = 'home_Screen';

  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedIndex = 0;

  List<Widget> homeBody = [
    HomeWidget(),
    SearchWidget(),
    BrowseWidget(),
    WatchListWidget(),
  ];

  void navigateToMovieDetails(Movie movie) {
    Navigator.pushNamed(
      context,
      MovieDetailsScreen.routeName,
      arguments: movie,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomNavBar(
        selectedIndex: selectedIndex,
        onItemTapped: (index) {
          setState(() {
            selectedIndex = index;
          });
        },
      ),
      body: homeBody[selectedIndex],
    );
  }
}

