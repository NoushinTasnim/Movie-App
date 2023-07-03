import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/constants.dart';

import 'components/body.dart';

class SeriesScreen extends StatelessWidget {
  const SeriesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgCol,
      appBar: buildAppBar(),
      body: Body(),
    );
  }
  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: kBgCol,
      elevation: 0,
      leading: Padding(
        padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
        child: IconButton(
          onPressed: () {},
          icon: Icon(
            Icons.menu,
          ),
        ),
      ),
      actions: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: kDefaultPadding),
          child: IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.search,
            ),
          ),
        ),
      ],
    );
  }
}
