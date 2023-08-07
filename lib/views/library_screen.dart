import 'package:flutter/material.dart';
import 'package:spotify_clone/core/styles/colors.dart';

class LibraryScreen extends StatefulWidget {
  const LibraryScreen({super.key});

  @override
  State<LibraryScreen> createState() => _LibraryScreenState();
}

class _LibraryScreenState extends State<LibraryScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 60,
          flexibleSpace: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 0),
            child: Column(
              children: [
                SizedBox(
                  height: 20,
                ),
                Container(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          CircleAvatar(
                            radius: 18,
                            child: Text(
                              'A',
                              style: TextStyle(fontWeight: FontWeight.w600),
                            ),
                          ),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'Your Library',
                            style: TextStyle(
                              fontSize: 24,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Icon(Icons.search_sharp, size: 30),
                          SizedBox(
                            width: 10,
                          ),
                          Icon(Icons.add_sharp, size: 32),
                        ],
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
          elevation: 0,
          backgroundColor: Colors.transparent,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 30,
            ),
            library_screen_list_widget(
              title: 'Liked Songs',
              subtitle: 'Playlist \u00B7 9 Songs',
              tileIcon: Icons.favorite,
              IconColor: Colors.white,
              bgColor: Color.fromARGB(255, 168, 162, 255),
              subtitleIcon1: Icons.push_pin,
              showSubtitleIcon2: true,
              subtitleIcon2: Icons.download_for_offline_rounded,
            ),
            library_screen_list_widget(
              title: 'Your Episodes',
              subtitle: 'Saved & downloaded episodes',
              IconColor: Color(0xFF1ED760),
              bgColor: Color.fromARGB(255, 1, 119, 96),
              tileIcon: Icons.bookmark,
              subtitleIcon1: Icons.push_pin,
              showSubtitleIcon2: false,
              subtitleIcon2: Icons.download_for_offline_rounded,
            ),
            library_screen_list_widget(
              title: 'New Episodes',
              subtitle: 'Updated 03-Aug-2023',
              IconColor: Color(0xFF1ED760),
              bgColor: Color.fromARGB(255, 99, 49, 131),
              tileIcon: Icons.notifications_rounded,
              subtitleIcon1: Icons.push_pin,
              showSubtitleIcon2: false,
              subtitleIcon2: Icons.download_for_offline_rounded,
            ),
            library_screen_option_widget(
              title: 'Add artists',
              IconColor: Colors.white,
              bgColor: Colors.grey.shade900,
              tileIcon: Icons.add,
            ),
            library_screen_option_widget(
              title: 'Add podcasts & shows',
              IconColor: Colors.white,
              bgColor: Colors.grey.shade900,
              tileIcon: Icons.add,
            ),
          ],
        ),
      ),
    );
  }
}

class library_screen_list_widget extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData tileIcon;
  final IconData subtitleIcon1;
  final IconData subtitleIcon2;
  final Color bgColor;
  final Color IconColor;
  final bool showSubtitleIcon2;

  library_screen_list_widget({
    super.key,
    required this.title,
    required this.subtitle,
    required this.tileIcon,
    required this.subtitleIcon1,
    required this.subtitleIcon2,
    required this.bgColor,
    required this.IconColor,
    required this.showSubtitleIcon2,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            child: Row(
              children: [
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      color: bgColor,
                      child: Icon(
                        tileIcon,
                        color: IconColor,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Row(
                          children: [
                            Icon(
                              subtitleIcon1,
                              color: CustomColors.primaryColor,
                              size: 14,
                            ),
                            if (showSubtitleIcon2) ...[
                              SizedBox(width: 5),
                              Icon(subtitleIcon2,
                                  color: CustomColors.primaryColor, size: 12),
                            ],
                            SizedBox(
                              width: 5,
                            ),
                            Text(
                              subtitle,
                              style: TextStyle(fontWeight: FontWeight.w300),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}

class library_screen_option_widget extends StatelessWidget {
  final String title;

  final IconData tileIcon;

  final Color bgColor;
  final Color IconColor;

  library_screen_option_widget({
    super.key,
    required this.title,
    required this.tileIcon,
    required this.bgColor,
    required this.IconColor,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SizedBox(
          height: 10,
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20),
          child: Container(
            child: Row(
              children: [
                Row(
                  children: [
                    Container(
                      width: 60,
                      height: 60,
                      color: bgColor,
                      child: Icon(
                        tileIcon,
                        color: IconColor,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  width: 15,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          title,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w500),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        SizedBox(
          height: 10,
        ),
      ],
    );
  }
}
