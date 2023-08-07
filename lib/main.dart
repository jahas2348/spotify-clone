import 'package:flutter/material.dart';
import 'package:spotify_clone/views/navigation.dart';
import 'package:spotify_clone/core/styles/colors.dart';
void main(){
  runApp(SpotifyClone());
}
class SpotifyClone extends StatelessWidget {
  const SpotifyClone({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: NavigationItems(),
       
      darkTheme: ThemeData(
        progressIndicatorTheme: ProgressIndicatorThemeData(color: CustomColors.primaryColor.shade100,circularTrackColor: CustomColors.primaryColor),
        brightness: Brightness.dark, // Use the dark theme
        fontFamily: 'circular', // Set your custom font here
        primaryColor: CustomColors.primaryColor,
        primaryColorDark: CustomColors.primaryColor,
        primaryColorLight: CustomColors.primaryColor,
        hintColor: CustomColors.primaryColor,
        scaffoldBackgroundColor: bgPrimary,
      ),
       
    );
  }
}