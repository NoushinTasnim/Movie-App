import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/constants.dart';
import '../../../../components/cast_card.dart';

class SimilarSeries extends StatelessWidget {

  final List similarSeries;

  const SimilarSeries({
    super.key,
    required this.similarSeries
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Similar Series',
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
                itemCount: similarSeries.length,
                itemBuilder: (context, index) => CastCard(
                  image: similarSeries[index]['poster'],
                  name: similarSeries[index]['title'],
                  character: '',
                )
            ),
          )
        ],
      ),
    );
  }
}
