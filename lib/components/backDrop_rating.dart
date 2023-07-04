import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../constants.dart';
import '../model/series.dart';

class backDropAndRating extends StatefulWidget {
  backDropAndRating({
    super.key,
    required this.size,
    required this.backDrop,
    required this.rating,
    required this.numOfRating,
    required this.metaScoreRating,
    required this.criticsReview,
  });

  final Size size;
  final String backDrop;
  final String rating;
  final String numOfRating;
  final String metaScoreRating;
  final String criticsReview;

  @override
  State<backDropAndRating> createState() => _backDropAndRatingState();
}

class _backDropAndRatingState extends State<backDropAndRating> {
  Icon icon = Icon(
    Icons.star_border_outlined,
    color: Colors.white,
  );

  @override
  Widget build(BuildContext context) {
    return Container(
      height: widget.size.height * 0.4,
      child: Stack(
        children: [
          Container(
            height: widget.size.height * 0.4 - 50,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(50),
                bottomLeft: Radius.circular(50),
              ),
              image: DecorationImage(
                fit: BoxFit.cover,
                image: NetworkImage(widget.backDrop),
              ),
            ),
          ),
          Positioned(
            bottom: 0,
            right: 0,
            child: Container(
              width: widget.size.width * 0.9,
              height: 100,
              decoration: BoxDecoration(
                color: kBgCol,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  bottomLeft: Radius.circular(50),
                ),
                boxShadow: [
                  BoxShadow(
                    offset: Offset(0,5),
                    blurRadius: 50,
                    color: Colors.black,
                  ),
                ],
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.star,
                        color: Colors.yellow,
                      ),
                      SizedBox(
                        height: kDefaultPadding/4,
                      ),
                      RichText(
                        text: TextSpan(
                            style: TextStyle(
                                color: Colors.white
                            ),
                            children: [
                              TextSpan(
                                text: '${widget.rating}/',
                                style: GoogleFonts.nunitoSans(
                                  fontSize: 16,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: '10\n',
                                style: GoogleFonts.nunitoSans(
                                  fontWeight: FontWeight.w500,
                                ),
                              ),
                              TextSpan(
                                text: '${widget.numOfRating}',
                                style: GoogleFonts.nunitoSans(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ]
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MaterialButton(
                        onPressed: () {
                          setState(() {
                            icon = (icon.icon == Icons.star_border_outlined) ? Icon(
                              Icons.star,
                              color: Colors.yellow,
                            ) : Icon(
                              Icons.star_border_outlined,
                              color: Colors.white,
                            );
                          });
                        },
                        child: icon,
                      ),
                      SizedBox(
                        height: kDefaultPadding/4,
                      ),
                      Text(
                        'Rate This',
                        style: GoogleFonts.nunitoSans(
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: EdgeInsets.all(6),
                        decoration: BoxDecoration(
                          color: Color(0xff51cf66),
                          borderRadius: BorderRadius.circular(2),
                        ),
                        child: Text(
                          '${widget.metaScoreRating}',
                          style: GoogleFonts.nunitoSans(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: kDefaultPadding/4,
                      ),
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                            style: TextStyle(
                                color: Colors.white
                            ),
                            children: [
                              TextSpan(
                                text: 'Metascore\n',
                                style: GoogleFonts.nunitoSans(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                              TextSpan(
                                text: '${widget.criticsReview} critic reviews',
                                style: GoogleFonts.nunitoSans(
                                  color: Colors.grey,
                                  fontWeight: FontWeight.w600,
                                ),
                              )
                            ]
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
          SafeArea(
              child: BackButton(
                color: Colors.white,
              ),
          )
        ],
      ),
    );
  }
}