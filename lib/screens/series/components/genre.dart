
import 'package:flutter/material.dart';

import '../../../constants.dart';
import '../../../genre_card.dart';

class Genre extends StatefulWidget {
  const Genre({super.key});

  @override
  State<Genre> createState() => _GenreState();
}

class _GenreState extends State<Genre> {

  int selectedGenre = 0;
  List<String> genre = [
    "Action & Adventure",
    "Animation",
    "Comedy",
    "Crime",
    "Documentary",
    "Drama",
    "Family",
    "Kids",
    "Mystery",
    "News",
    "Reality",
    "Sci-Fi & Fantasy",
    "Soap",
    "Talk",
    "War & Politics",
    "Western"
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: kDefaultPadding),
      height: 36,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: genre.length,
        itemBuilder: (context, index) => GestureDetector(
          onTap: (){
            setState(() {
              selectedGenre = index;
            });
          },
          child: GenreCard(
            selectedGenre: selectedGenre,
            genre: genre[index],
            index: index,
          ),
        ),
      ),
    );
  }
}
