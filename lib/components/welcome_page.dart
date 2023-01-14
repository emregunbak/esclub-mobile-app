import 'package:flutter/cupertino.dart';
import 'package:lottie/lottie.dart';

class WelcomePage extends StatefulWidget {
  const WelcomePage({super.key});

  @override
  State<StatefulWidget> createState() => _Welcome();
}

class _Welcome extends State<WelcomePage> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Container(
          margin: const EdgeInsets.symmetric(vertical: 20),
          child: const Text("Welcome to EsClub",
            style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
        Center(
          child: Lottie.asset("assets/animations/club.json"),
        ),
        Container(
          margin: const EdgeInsets.fromLTRB(0, 20, 0, 0),
          child: SizedBox(
            width: 100,
            height: 100,
            child: Image.asset("assets/esclub-logo.png"),
          ),
        ),
      ],
    );
  }
}
