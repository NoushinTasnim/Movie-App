import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/screens/series/series_details/details_screen.dart';
import '../../../constants.dart';
import '../../../model/series.dart';

class SeriesCard extends StatelessWidget {

  final Series series;

  const SeriesCard({
    super.key,
    required this.series});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      closedElevation: 0,
      openElevation: 0,
      closedBuilder: (context, action) => buildMovieCard(),
      openBuilder: (context, action) => DetailsScreen(series: series),
    );
  }

  Padding buildMovieCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding, horizontal: kDefaultPadding),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(series.poster),
                  )
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: kDefaultPadding, bottom: kDefaultPadding/2),
            child: Text(
              series.title,
              style: GoogleFonts.nunitoSans(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.bold
              ),
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                Icons.star,
                size: 25,
                color: Colors.yellow,
              ),
              SizedBox(
                width: kDefaultPadding/2,
              ),
              Text(
                '${series.rating}',
                style: GoogleFonts.nunitoSans(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w400
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

