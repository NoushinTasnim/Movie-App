
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:movie_app/constants.dart';
import 'package:movie_app/screens/main_screen.dart';

import '../model/movie.dart';
import '../model/series.dart';

class LoadingScreen extends StatefulWidget {
  const LoadingScreen({super.key});

  @override
  State<LoadingScreen> createState() => _LoadingScreenState();
}

class _LoadingScreenState extends State<LoadingScreen> {


  @override
  void initState() {
    super.initState();
    getData();
  }

  void getData() async {
    try {
      final movies = await fetchMovies('https://api.themoviedb.org/3/movie/popular');
      final series = await fetchSeries('https://api.themoviedb.org/3/tv/popular');
      print(series);
      Navigator.push(context, MaterialPageRoute(builder: (context) {
        return MainScreen();
      }));
    } catch (e) {
      print('Error: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBgCol,
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 100.0,
        ),
      ),
    );
  }
}
