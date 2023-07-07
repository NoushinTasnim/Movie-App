import 'package:flutter/material.dart';
import '../../../../constants.dart';
import '../../../../genre_card.dart';

class Genre extends StatefulWidget {
  const Genre({super.key});

  @override
  State<Genre> createState() => _GenreState();
}

class _GenreState extends State<Genre> {

  int selectedGenre = -1;
  List<String> genre = [
    "Action",
    "Adventure",
    "Animation",
    "Comedy",
    "Crime",
    "Documentary",
    "Drama",
    "Family",
    "Fantasy",
    "History",
    "Horror",
    "Music",
    "Mystery",
    "Romance",
    "Science Fiction",
    "TV Movie",
    "Thriller",
    "War",
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
            onTap: () async {
              setState(() {
                if(selectedGenre == index)
                  selectedGenre = -1;
                else
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
