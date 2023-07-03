import 'package:flutter/material.dart';
import 'package:movie_app/screens/series/components/carousel.dart';
import 'package:movie_app/screens/series/components/category.dart';
import 'package:movie_app/screens/series/components/genre.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          CategoryList(),
          Genre(),
          Carousel(),
        ],
      ),
    );
  }
}