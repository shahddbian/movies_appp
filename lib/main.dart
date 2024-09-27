import 'package:flutter/material.dart';
import 'package:movies_appp/Theme/myTheme.dart';
import 'package:movies_appp/home_screen/home_screen.dart';
import 'package:movies_appp/browse_screen/browse_widget.dart';
import 'package:movies_appp/browse_screen/moviecategory_item.dart';
import 'HomeScreenDetail/MovieDetailScreen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Movies App',
      initialRoute: HomeScreen.routeName,
      routes: {
        HomeScreen.routeName: (context) => HomeScreen(),
        BrowseWidget.routeName: (context) => BrowseWidget(),
        MovieCategoryItem.routeName: (context) => MovieCategoryItem(),
        MovieDetailsScreen.routeName: (context) => MovieDetailsScreen(),
      },
      debugShowCheckedModeBanner: false,
      theme: MyTheme.AppTheme,
    );
  }
}

