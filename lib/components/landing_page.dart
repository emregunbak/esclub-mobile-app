import 'package:esclub/components/register.dart';
import "package:flutter/material.dart";
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:video_player/video_player.dart";

import 'login.dart';

class LandingPage extends StatefulWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  State<LandingPage> createState() => _LandingPageState();
}

class _LandingPageState extends State<LandingPage> {
  late VideoPlayerController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        VideoPlayerController.asset("assets/animations/landing_animation_2.mp4")
          ..initialize().then((_) {
            setState(() {});
          })
          ..setVolume(0.0);
    playVideo();
  }

  void playVideo() {
    _controller.play();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        title: const Text(
          "EsClub",
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Login()),
                  );
                },
                child: Text(
                  "Login",
                  style: TextStyle(color: Colors.red[900]),
                )),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.grey[200],
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15),
                  ),
                ),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const Register()),
                  );
                },
                child: Text(
                  "Register",
                  style: TextStyle(color: Colors.red[900]),
                )),
          )
        ],
      ),
      backgroundColor: Colors.white,
      body: Wrap(
        children: [
          Center(
            child: _controller.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller.value.aspectRatio,
                    child: VideoPlayer(_controller),
                  )
                : const CircularProgressIndicator(),
          ),
        ],
      ),
      bottomSheet: Container(
        height: 50,
        color: Colors.red[900],
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            IconButton(
              icon: Icon(
                FontAwesomeIcons.facebook,
                color: Colors.white,
                size: 30,
              ),
              onPressed: null,
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.instagram,
                color: Colors.white,
                size: 30,
              ),
              onPressed: null,
            ),
            IconButton(
              icon: Icon(
                FontAwesomeIcons.twitter,
                color: Colors.white,
                size: 30,
              ),
              onPressed: null,
            ),
          ],
        ),
      ),
    );
  }
}
