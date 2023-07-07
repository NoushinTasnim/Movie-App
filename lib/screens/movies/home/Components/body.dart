import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import 'carousel.dart';
import 'categories.dart';
import 'genres.dart';

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