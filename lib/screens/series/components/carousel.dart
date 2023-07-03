import 'dart:math';

import 'package:flutter/material.dart';
import 'package:movie_app/screens/series/components/series_car.dart';

import '../../../constants.dart';
import '../../../model/movie.dart';
import '../../../model/series.dart';
import '../../home/Components/movie_card.dart';

class Carousel extends StatefulWidget {
  const Carousel({super.key});

  @override
  State<Carousel> createState() => _CarouselState();
}

class _CarouselState extends State<Carousel> {

  late PageController _pageController;
  int initialPage = 1;


  @override
  void initState() {
    super.initState();
    _pageController = PageController(
      viewportFraction: 0.7,
      initialPage: initialPage,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: kDefaultPadding),
      child: AspectRatio(
        aspectRatio: .85,
        child: PageView.builder(
            onPageChanged: (value){
              setState(() {
                initialPage = value;
              });
            },
            controller: _pageController,
            physics: ClampingScrollPhysics(),
            itemCount: series.length,
            itemBuilder: (context, index) => buildMovieCard(index)
        ),
      ),
    );
  }

  Widget buildMovieCard(int index) => AnimatedBuilder(
    animation: _pageController,
    builder: (context, child) {
      double value = 0;
      if(_pageController.position.haveDimensions){
        value = index - (_pageController.page)!.toDouble();
        value = (value * 0.1).clamp(-1, 1);
      }
      return AnimatedOpacity(
        duration: Duration(milliseconds: 500),
        opacity: initialPage == index ? 1 : 0.25,
        child: Transform.rotate(
          angle: pi*value,
          child: SeriesCard(
            series: series[index],
          ),
        ),
      );
    },
  );
}