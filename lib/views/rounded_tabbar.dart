import 'package:flutter/material.dart';

class RoundedTabBar extends StatelessWidget implements PreferredSizeWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: TabBar(
        isScrollable: true,
        indicator: BoxDecoration(
          borderRadius: BorderRadius.circular(30), // Adjust the radius as needed
          color: Colors.blue, // Customize the selected tab indicator color
        ),
        tabs: [
          Tab(text: 'Recommendations'),
          Tab(text: 'Featured Playlists'),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(kToolbarHeight);
}
