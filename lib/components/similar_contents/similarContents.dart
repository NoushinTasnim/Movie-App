import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/components/similar_contents/similarContentCard.dart';
import 'package:movie_app/constants.dart';

class SimilarContent extends StatelessWidget {

  final List similarContent;

  SimilarContent({
    super.key,
    required this.similarContent
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Similar Contents',
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
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: similarContent.length,
              itemBuilder: (context, index) => SimilarContentCard(
                image: similarContent[index]['poster'],
                name: similarContent[index]['title'],
                character: '',
              ),
            ),
          )
        ],
      ),
    );
  }
}
