import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';

import '../../../model/movie.dart';
import 'body.dart';

class DetailsScreen extends StatelessWidget {

  final Movie movie;

  const DetailsScreen({
    super.key,
    required this.movie
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgCol,
      body: Body(movie: movie,),
    );
  }
}
