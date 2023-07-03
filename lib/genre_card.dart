import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'constants.dart';

class GenreCard extends StatelessWidget {
  const GenreCard({
    super.key,
    required this.selectedGenre,
    required this.genre, required this.index,
  });

  final int selectedGenre;
  final String genre;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: kDefaultPadding/2),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: selectedGenre == index ? kSecondaryColor : Colors.transparent,
        border: Border.all(
          color: selectedGenre == index ? kSecondaryColor :Colors.white.withOpacity(0.5),
          width: 1,
        ),
        borderRadius: BorderRadius.circular(24),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: Text(
          genre,
          style: GoogleFonts.nunitoSans(
            color: Colors.white,
            fontSize: 14,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}