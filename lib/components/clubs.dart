import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import 'club_details.dart';

class Clubs extends StatefulWidget {
  const Clubs({Key? key}) : super(key: key);

  @override
  State<Clubs> createState() => _ClubsState();
}

class _ClubsState extends State<Clubs> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Center(
                    child: Text(
                      'Clubs',
                      style: Theme.of(context).textTheme.headline5,
                    ),
                  ),
                ),
                Wrap(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 5, horizontal: 5),
                      child: Card(
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15.0),
                        ),
                        color: Colors.grey[400],
                        child: Padding(
                          padding: const EdgeInsets.all(10.0),
                          child: Text(
                            "This is the clubs page. Here you can find all "
                            "the clubs that are part of EsClub.",
                            style: TextStyle(
                                fontSize: 16,
                                fontFamily: GoogleFonts.openSans().fontFamily),
                          ),
                        ),
                      ),
                    )
                  ],
                ),
                Wrap(
                  children: [
                    for (var i = 0; i < 10; i++)
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.white,
                          minimumSize: Size.zero,
                          padding: EdgeInsets.zero,
                        ),
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const ClubDetails()));
                        },
                        child: ClubCard(
                          child: Column(
                            children: [
                              Image.asset("assets/clubs/eestec.jpg"),
                              const Divider(color: Colors.black),
                              const Text("EESTEC",
                                  style:
                                      TextStyle(fontWeight: FontWeight.bold)),
                            ],
                          ),
                        ),
                      ),
                  ],
                )
              ],
            ),
          ],
        ),
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
