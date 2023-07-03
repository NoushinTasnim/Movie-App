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
  late List<YoutubePlayerController> controllers;

  @override
  void initState() {
    super.initState();
    controllers = widget.videos.map((video) {
      final String videoKey = video['key'] ?? '';
      return YoutubePlayerController(
        initialVideoId: videoKey,
        flags: YoutubePlayerFlags(
          autoPlay: false,
          mute: false,
        ),
      );
    }).toList();
  }

  @override
  void dispose() {
    for (var controller in controllers) {
      controller.dispose();
    }
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgCol,
      body: Stack(
        children: [
          Column(
            children: [
              Container(
                width: double.infinity,
                height: 300,
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: YoutubePlayer(
                  controller: controllers[selectedIndex],
                  showVideoProgressIndicator: true,
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.videos.length,
                  itemBuilder: (context, index) {
                    final video = widget.videos[index];
                    final String videoName = video['name'] ?? '';

                    return ListTile(
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
                        });
                      },
                    );
                  },
                ),
              ),
            ],
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