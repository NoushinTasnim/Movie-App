import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/constants.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class PlayScreen extends StatefulWidget {
  final List<Map<String, String>> videos;

  PlayScreen({Key? key, required this.videos}) : super(key: key);

  @override
  State<PlayScreen> createState() => _PlayScreenState();
}

class _PlayScreenState extends State<PlayScreen> {
  int selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgCol,
      body: Container(
        child: Stack(
          children: [
            SafeArea(
              child: BackButton(
                color: Colors.white,
              ),
            ),
            Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 300,
                  decoration: BoxDecoration(
                    color: Colors.white,
                  ),
                  child: youTubePlayer(key: UniqueKey(), widget: widget, selectedIndex: selectedIndex),
                ),
                Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: kBgCol,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black,
                        offset: Offset(0,0),
                        blurRadius: 10,
                        spreadRadius: 8
                      )
                    ]
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(kDefaultPadding),
                    child: Text(
                      widget.videos[selectedIndex]['name']!,
                      style: GoogleFonts.nunitoSans(
                        fontSize: 20,
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: widget.videos.length,
                    itemBuilder: (context, index) {
                      final video = widget.videos[index];
                      final String videoName = video['name'] ?? '';
                      final String videoKey = video['key'] ?? '';

                      return ListTile(
                        selectedColor: kSecondaryColor,
                        leading: Icon(
                          selectedIndex == index ? Icons.pause_circle : Icons.play_circle,
                          color: selectedIndex == index ? kSecondaryColor : Colors.white,
                        ),
                        title: Text(
                          videoName,
                          style: GoogleFonts.nunitoSans(
                            color: selectedIndex == index ? kSecondaryColor : Colors.white,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            selectedIndex = index;
                            youTubePlayer(key: UniqueKey(), widget: widget, selectedIndex: selectedIndex);
                          });
                        },
                      );
                    },
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class youTubePlayer extends StatelessWidget {
  const youTubePlayer({
    super.key,
    required this.widget,
    required this.selectedIndex,
  });

  final PlayScreen widget;
  final int selectedIndex;

  @override
  Widget build(BuildContext context) {
    return YoutubePlayer(
      controller: YoutubePlayerController(
        initialVideoId: widget.videos[selectedIndex]['key'] ?? '',
        flags: YoutubePlayerFlags(
          autoPlay: true,
          mute: false,
        ),
      ),
      showVideoProgressIndicator: true,
    );
  }
}
