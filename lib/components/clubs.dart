import 'package:flutter/material.dart';

class Clubs extends StatefulWidget {
  const Clubs({Key? key}) : super(key: key);

  @override
  State<Clubs> createState() => _ClubsState();
}

class _ClubsState extends State<Clubs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
             Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                'Clubs',
                style: Theme.of(context).textTheme.headline5,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                for(var i = 0; i < 3; i++)
                  ClubCard(child: Column(
                    children: [
                      Image.asset("assets/clubs/eestec.jpg"),
                      const Divider(color: Colors.black),
                      const Text("EESTEC", style: TextStyle(fontWeight: FontWeight.bold)),
                    ],
                  )),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ClubCard(child: Column(
                  children: [
                    Image.asset("assets/clubs/eestec.jpg"),
                    const Divider(color: Colors.black),
                    const Text("EESTEC", style: TextStyle(fontWeight: FontWeight.bold)),
                  ],
                )),
                ClubCard(child: Image.asset("assets/esclub-logo.png")),
                ClubCard(child: Image.asset("assets/esclub-logo.png")),
              ],
            ),
          ],
      ),
    );
  }
}

class ClubCard extends StatelessWidget {
  const ClubCard({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      child: SizedBox(
        width: 100,
        height: 150,
        child: child,
      ),
    );
  }
}

