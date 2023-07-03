import 'package:flutter/material.dart';
import 'package:movie_app/constants.dart';
import '../../../model/series.dart';
import 'components/body.dart';

class DetailsScreen extends StatelessWidget {

  final Series series;

  const DetailsScreen({
    super.key,
    required this.series
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgCol,
      body: Body(series: series,),
    );
  }
}
