import 'package:animations/animations.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/screens/movies/details/details_screen.dart';
import '../../../../constants.dart';
import '../../../../model/movie.dart';

class MovieCard extends StatelessWidget {

  final Movie movie;

  const MovieCard({
    super.key,
    required this.movie});

  @override
  Widget build(BuildContext context) {
    return OpenContainer(
      closedColor: Colors.transparent,
      openColor: Colors.transparent,
      closedElevation: 0,
      openElevation: 0,
      closedBuilder: (context, action) => buildMovieCard(),
      openBuilder: (context, action) => DetailsScreen(movie: movie),
    );
  }

  Padding buildMovieCard() {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: kDefaultPadding, horizontal: kDefaultPadding*1.25),
      child: Column(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  image: DecorationImage(
                    fit: BoxFit.fill,
                    image: NetworkImage(movie.poster),
                  )
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: kDefaultPadding/2),
            child: Text(
              movie.title,
              style: GoogleFonts.nunitoSans(
                  fontSize: 24,
                  color: Colors.white,
                  fontWeight: FontWeight.w600
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
                '${movie.rating}',
                style: GoogleFonts.nunitoSans(
                    color: Colors.white,
                    fontSize: 20,
                    fontWeight: FontWeight.w600
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}

