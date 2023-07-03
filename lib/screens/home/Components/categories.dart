import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/model/movie.dart';

import '../../../constants.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  int selectedCategory = 0;
  List<String> categories = [
    'Popular',
    'Trending Now',
    'Top Rated',
    'Coming Soon',
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: kDefaultPadding/4, horizontal: kDefaultPadding/2),
      height: 60,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: categories.length,
          itemBuilder: (context, index) => buildCategory(index)),
    );
  }

  Padding buildCategory(int index) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
      child: GestureDetector(
        onTap: () async {
          setState(() {
            selectedCategory = index;
          });
          if (index == 1) {
            try {
              print('waiting for tonight');
              final movies = await fetchMovies('https://api.themoviedb.org/3/movie/now_playing');
              // Update your movie list using the fetched movies
            } catch (error) {
              // Handle any errors that occurred during fetching
              print('Failed to fetch movies: $error');
            }
          }else if (index == 0) {
            try {
              print('waiting for tonight');
              final movies = await fetchMovies('https://api.themoviedb.org/3/movie/popular');
              // Update your movie list using the fetched movies
            } catch (error) {
              // Handle any errors that occurred during fetching
              print('Failed to fetch movies: $error');
            }
          }else if (index == 3) {
            try {
              print('waiting for tonight');
              final movies = await fetchMovies('https://api.themoviedb.org/3/movie/upcoming');
              // Update your movie list using the fetched movies
            } catch (error) {
              // Handle any errors that occurred during fetching
              print('Failed to fetch movies: $error');
            }
          }else if (index == 2) {
            try {
              print('waiting for tonight');
              final movies = await fetchMovies('https://api.themoviedb.org/3/movie/top_rated');
              // Update your movie list using the fetched movies
            } catch (error) {
              // Handle any errors that occurred during fetching
              print('Failed to fetch movies: $error');
            }
          }
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              categories[index],
              style: GoogleFonts.nunitoSans(
                color: index == selectedCategory ? kSecondaryColor : Colors.white,
                fontSize: 24,
                fontWeight: FontWeight.w500,
              ),
            ),
            Container(
              margin: EdgeInsets.symmetric(vertical: 8),
              height: 6,
              width: 40,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: index==selectedCategory ? kSecondaryColor : Colors.transparent,
              ),
            )
          ],
        ),
      ),
    );
  }
}
