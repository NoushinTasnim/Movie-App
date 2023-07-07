
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants.dart';
import '../../../model/series.dart';

class CategoryList extends StatefulWidget {
  const CategoryList({super.key});

  @override
  State<CategoryList> createState() => _CategoryListState();
}

class _CategoryListState extends State<CategoryList> {

  int selectedCategory = 0;
  List<String> categories = [
    'Popular',
    'On The Air',
    'Airing Today',
    'Top Rated',
  ];

  List<String> cats = [
    'popular',
    'on_the_air',
    'airing_today',
    'top_rated',
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

          try {
            print('waiting for tonight');
            final series = await fetchSeries('https://api.themoviedb.org/3/tv/${cats[index]}');
              // Update your movie list using the fetched movies
          } catch (error) {
              // Handle any errors that occurred during fetching
            print('Failed to fetch series: $error');
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
