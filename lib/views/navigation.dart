import 'package:flutter/material.dart';
import 'package:spotify_clone/core/styles/colors.dart';
import 'package:spotify_clone/views/home_screen.dart';
import 'package:spotify_clone/views/library_screen.dart';
import 'package:spotify_clone/views/premium_screen.dart';
import 'package:spotify_clone/views/search_screen.dart';



class NavigationItems extends StatefulWidget {
  NavigationItems({super.key});

  @override
  State<NavigationItems> createState() => _NavigationItemsState();
}

class _NavigationItemsState extends State<NavigationItems> {
  int _currentIndex = 0;
  final List<Widget> _screens = [
    HomeScreen(),
    SearchScreen(),
    LibraryScreen(),
    PremiumScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          for (int index = 0; index < _screens.length; index++)
            AnimatedOpacity(
              opacity: _currentIndex == index ? 1.0 : 0.0,
              duration: Duration(milliseconds: 200),
              child: IgnorePointer(
                ignoring: _currentIndex != index,
                child: _screens[index],
              ),
            ),
        ],
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: BottomNavigationBar(
          
          backgroundColor: bgPrimary,
          selectedItemColor: Colors.white,
          unselectedItemColor: Colors.grey.shade500,
          selectedFontSize: 12,
          unselectedFontSize: 12,
          elevation: 0,
          enableFeedback: false,
          type: BottomNavigationBarType.fixed,
          currentIndex: _currentIndex,
          onTap: (index) {
            setState(() {
              _currentIndex = index;
            });
          },
          items: [
            BottomNavigationBarItem(
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.home),
              ),
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.home_outlined),
              ),
              label: 'Home',
            ),
            BottomNavigationBarItem(
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.search),
              ),
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.search),
              ),
              label: 'Search',
            ),
            BottomNavigationBarItem(
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.library_music),
              ),
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.library_music_outlined),
              ),
              label: 'Library',
            ),
            BottomNavigationBarItem(
              activeIcon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.star),
              ),
              icon: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Icon(Icons.star_border_outlined),
              ),
              label: 'Premium',
            ),
          ],
        ),
      ),
    );
  }
}
