import 'package:flutter/material.dart';

class SearchGridItemWidget extends StatelessWidget {
  final String title;
  final String assetImage;
  final Color bgColor;
  SearchGridItemWidget({required this.title, required this.assetImage, required this.bgColor});

  @override
  Widget build(BuildContext context) {
    double degreesToRadians(double degrees) {
  return degrees * (90 / 360);
}
    return ClipRRect(
      child: Container(
        // height: 100,
        decoration: BoxDecoration(
          color: bgColor, // Replace with your desired background color
          borderRadius: BorderRadius.circular(4),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [

            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: const EdgeInsets.only(top: 10,left: 10),
                child: Text(
                  title,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            
            Align(
               alignment: Alignment.topRight,
              child: Transform.rotate(
                angle: degreesToRadians(1.0),
            
                child: Transform.translate(
                  offset: Offset(20.0, 20.0),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(8.0),
                    child: Image.asset(
                      assetImage,
                      width: 70,
                      height: 70,
                      // Replace the width and height with your desired size
                    ),
                  ),
                ),
              ),
            ),
            
            
          ],
        ),
      ),
    );
  }
}