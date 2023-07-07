import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:transparent_image/transparent_image.dart';
import '../../../constants.dart';

class SimilarContentCard extends StatelessWidget {

  const SimilarContentCard({
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
      width: 100,
      margin: EdgeInsets.only(right: kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 160,
            width: 100,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(30),
            ),
            child: ClipRect(
              child: FadeInImage.memoryNetwork(
                placeholder: kTransparentImage, // Placeholder image (e.g., a transparent image)
                image: image, // Image URL
                fit: BoxFit.cover,
                fadeInDuration: Duration(milliseconds: 200),
                fadeOutDuration: Duration(milliseconds: 200),
                imageErrorBuilder: (context, error, stackTrace) {
                  return Icon(
                    Icons.movie,
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