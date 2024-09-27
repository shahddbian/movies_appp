import 'package:flutter/material.dart';
import 'package:movies_appp/Theme/myTheme.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedIndex;
  final Function(int) onItemTapped;

  const BottomNavBar({
    Key? key,
    required this.selectedIndex,
    required this.onItemTapped,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;

    return Theme(
      data: Theme.of(context).copyWith(
        canvasColor: MyTheme.bottomNavigationBackgroundColor,
      ),
      child: SizedBox(
        height: screenSize.height * .09,
        child: BottomNavigationBar(
          currentIndex: selectedIndex,
          onTap: onItemTapped,
          items: [
            BottomNavigationBarItem(
              icon: bottomNavIcon(assetImage: "lib/images/Home icon (1).png"),
              label: "Home",
            ),
            BottomNavigationBarItem(
              icon: bottomNavIcon(assetImage: "lib/images/search-2.png"),
              label: "Search",
            ),
            BottomNavigationBarItem(
              icon: bottomNavIcon(assetImage: "lib/images/Icon ionic-md-bookmarks.png"),
              label: "Browse",
            ),
            BottomNavigationBarItem(
              icon: bottomNavIcon(assetImage: "lib/images/Icon material-movie.png"),
              label: "WatchList",
            ),
          ],
        ),
      ),
    );
  }

  Padding bottomNavIcon({required String assetImage}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8.0),
      child: ImageIcon(
        AssetImage(assetImage),
      ),
    );
  }
}