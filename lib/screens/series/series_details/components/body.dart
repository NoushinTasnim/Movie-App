import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/constants.dart';
import '../../../../model/series.dart';
import '../../../../components/backDrop_rating.dart';
import 'cast_crew.dart';
import 'genres.dart';
import '../../../../components/title_duration_fab.dart';

class Body extends StatelessWidget {

  final Series series;

  const Body({
    super.key,
    required this.series
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
              backDrop: series.backdrop,
              rating: series.rating.toString(),
              numOfRating: series.numOfRatings.toString(),
              metaScoreRating: series.metascoreRating.toString(),
              criticsReview: series.criticsReview.toString(),
            ),
            TitleDurationFab(
              id: series.id,
              text : 'tv',
              text2 : '${series.seasons} Season/s  ${series.episodes} Total Episodes',
              title: series.title,
              year: series.year.isNotEmpty ? "First aired: " + series.year : '',
            ),
            Genres(series: series),
            if(series.plot.isNotEmpty)
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
            if(series.plot.isNotEmpty)
              Padding(
              padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
              child: Text(
                '${series.plot}',
                style: GoogleFonts.nunitoSans(
                  color: Colors.white.withOpacity(0.8),
                  fontSize: 14,
                ),
              ),
            ),
            if (series.cast.isNotEmpty)
              CastAndCrew(casts: series.cast),
          ],
        ),
      ),
    );
  }
}
