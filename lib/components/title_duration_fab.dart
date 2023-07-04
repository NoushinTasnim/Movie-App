import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../constants.dart';
import '../screens/play_screen.dart';

class TitleDurationFab extends StatefulWidget {
  const TitleDurationFab({
    super.key,
    required this.title,
    required this.year,
    required this.id,
    required this.text,
    required this.text2,
  });

  final String title;
  final String year;
  final int id;
  final String text;
  final String text2;

  @override
  State<TitleDurationFab> createState() => _TitleDurationFabState();
}

class _TitleDurationFabState extends State<TitleDurationFab> {

  List<Map<String, String>> videos = [];

  Future<void> fetchVideos() async {
    final apiKey = '5f80bc0b10a444db9c045e07de26b900'; // Replace with your actual API key
    final url = 'https://api.themoviedb.org/3/' +widget.text + '/${widget.id}/videos?api_key=$apiKey';
    print(url);
    try {
      final response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final List<dynamic> results = data['results'];

        final List<Map<String, String>> fetchedVideos = results.map<Map<String, String>>((json) {
          final String name = json['name'];
          final String key = json['key'];
          return {'name': name, 'key': key};
        }).toList();

        setState(() {
          videos = fetchedVideos;
        });
      } else {
        print('Failed to fetch videos: ${response.statusCode}');
      }
    } catch (error) {
      print('Error fetching videos: $error');
    }
  }

  void showSnackbar(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        backgroundColor: kBgCol,
        content: Text('No video is available for this content'),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(kDefaultPadding),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.title,
                  style: GoogleFonts.nunitoSans(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                  textAlign: TextAlign.start,
                ),
                SizedBox(
                  height: kDefaultPadding/2,
                ),
                Text(
                 widget.text2,
                  style: GoogleFonts.nunitoSans(
                    color: Colors.grey,
                  ),
                ),
                Text(
                  widget.year,
                  style: GoogleFonts.nunitoSans(
                    color: Colors.grey,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 64,
            width: 64,
            child: MaterialButton(
              onPressed: () async {
                await fetchVideos();
                if(videos.isNotEmpty){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder:
                        (context) => PlayScreen(videos: videos,))
                  );
                }
                else{
                  showSnackbar(context);
                }
              },
              color: kSecondaryColor,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
              child: Icon(
                Icons.play_arrow,
                size: 28,
                color: Colors.white,
              ),
            ),
          ),
        ],
      ),
    );
  }
}