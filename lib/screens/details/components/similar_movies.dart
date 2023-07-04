import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/constants.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import '../../../model/movie.dart';
import '../../../components/cast_card.dart';

class SimilarMovies extends StatelessWidget {

  final List similarMovies;

  SimilarMovies({
    super.key,
    required this.similarMovies
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Similar Movies',
            style: GoogleFonts.nunitoSans(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: similarMovies.length,
              itemBuilder: (context, index) => CastCard(
                image: similarMovies[index]['poster'],
                name: similarMovies[index]['title'],
                character: '',
              ),
            ),
          )
        ],
      ),
    );
  }
}
