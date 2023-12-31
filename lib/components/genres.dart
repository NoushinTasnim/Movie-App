import 'package:flutter/material.dart';

import '../constants.dart';
import '../genre_card.dart';
import '../model/movie.dart';

class Genres extends StatelessWidget {
  const Genres({
    super.key,
    required this.genre,
  });

  final List genre;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding/2),
      child: SizedBox(
        height: 36,
        child: ListView.builder(
            scrollDirection: Axis.horizontal,
            itemCount: genre.length,
            itemBuilder: (context, index) => GenreCard(
              selectedGenre: -1,
              genre: genre[index],
              index: index,
            )),
      ),
    );
  }
}