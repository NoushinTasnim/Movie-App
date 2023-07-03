import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/constants.dart';
import '../../../../components/cast_card.dart';

class CastAndCrew extends StatelessWidget {

  final List casts;

  const CastAndCrew({
    super.key,
    required this.casts
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Cast & Crew',
            style: GoogleFonts.nunitoSans(
              fontWeight: FontWeight.w500,
              fontSize: 20,
              color: Colors.white,
            ),
          ),
          SizedBox(
            height: kDefaultPadding,
          ),
          SizedBox(
            height: 200,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
                itemCount: casts.length,
                itemBuilder: (context, index) => CastCard(
                  image: casts[index]['image'],
                  name: casts[index]['orginalName'],
                  character: casts[index]['movieName'],
                )
            ),
          )
        ],
      ),
    );
  }
}
