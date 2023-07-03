import 'package:flutter/material.dart';
import '../../constants.dart';
import 'Components/body.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

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
            onPressed: (){},
            icon: Icon(
              Icons.search,
            ),
          ),
        ),
      ],

    );
  }
}
