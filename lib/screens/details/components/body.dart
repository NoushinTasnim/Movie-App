import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/constants.dart';
import '../../../components/title_duration_fab.dart';
import '../../../model/movie.dart';
import '../../../components/backDrop_rating.dart';
import 'cast_crew.dart';
import 'genres.dart';

class Body extends StatelessWidget {

  final Movie movie;

  const Body({
    super.key,
    required this.movie
  });

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SingleChildScrollView(
      child: Container(
        color: kBgCol,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            backDropAndRating(
              size: size,
              backDrop: movie.backdrop,
              rating: movie.rating.toString(),
              numOfRating: movie.numOfRatings.toString(),
              metaScoreRating: movie.metascoreRating.toString(),
              criticsReview: movie.criticsReview.toString(),
            ),
            TitleDurationFab(
              title: movie.title,
              id: movie.id,
              text: 'movie',
              text2: 'Runtime: ' + movie.runtime + " min",
              year: "Released on: " + movie.year.toString(),
            ),
            Genres(movie: movie),
            Padding(
              padding: EdgeInsets.symmetric(vertical: kDefaultPadding/2, horizontal: kDefaultPadding),
              child: Text(
                'Plot Summary',
                style: GoogleFonts.nunitoSans(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Text(
                '${movie.plot}',
                style: GoogleFonts.nunitoSans(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 14,
                ),
              ),
            ),
            if (movie.cast.isNotEmpty)
              CastAndCrew(casts: movie.cast),
          ],
        ),
      ),
    );
  }
}
