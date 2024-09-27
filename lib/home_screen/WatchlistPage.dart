import 'package:flutter/material.dart';
import 'package:movies_appp/home_screen/widgets/home_widgets/watchlist_widget.dart';

class WatchlistPage extends StatelessWidget {
  static const routeName = 'watchlist';  // Define the route name for this page

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: WatchlistWidget(),
    );
  }
}
