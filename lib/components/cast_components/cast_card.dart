import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../constants.dart';

class CastCard extends StatelessWidget {
  const CastCard({
    super.key,
    required this.image,
    required this.name,
    required this.character,
  });

  final String image;
  final String name;
  final String character;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 80,
      margin: EdgeInsets.only(right: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 80,
            width: 80,
            decoration: BoxDecoration(
              shape: BoxShape.circle,
            ),
            child: ClipOval(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage, // Placeholder image (e.g., a transparent image)
                image: image, // Image URL
                fit: BoxFit.cover,
                fadeInDuration: Duration(milliseconds: 200),
                fadeOutDuration: Duration(milliseconds: 200),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 50,
                  ); // Show an error icon if image fails to load
                },
                placeholderErrorBuilder: (context, error, stackTrace) {
                  return CircularProgressIndicator(); // Show a progress indicator if placeholder image fails to load
                },
              ),
            ),
          ),
          SizedBox(
            height: kDefaultPadding/2,
          ),
          Text(
            name,
            style: GoogleFonts.nunitoSans(
                color: Colors.white,
                fontSize: 12,
                fontWeight: FontWeight.w600
            ),
          ),
          SizedBox(
            height: kDefaultPadding/4,
          ),
          Text(
            character,
            style: GoogleFonts.nunitoSans(
                color: Colors.grey,
                fontSize: 12,
                fontWeight: FontWeight.w500
            ),
          ),
        ],
      ),
    );
  }
}