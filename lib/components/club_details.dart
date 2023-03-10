import 'package:flutter/material.dart';

import '../models/club.dart';

class ClubDetails extends StatelessWidget {
  const ClubDetails({Key? key, required this.club}) : super(key: key);
  final Club club;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[900],
        centerTitle: true,
        title: const Text(
          "EsClub",
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Center(
                    child: Text(club.clubName,
                        style: const TextStyle(
                          fontSize: 28,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        )),
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Card(
                      shape: const CircleBorder(),
                      margin: const EdgeInsets.all(10),
                      child: SizedBox(
                        width: 150,
                        height: 150,
                        child: Image.network(club.logo.imageURL),
                      ),
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    SizedBox(
                      width: 320,
                      height: 250,
                      child: Text(
                        "EESTEC is a non-profit, non-political, non-governmental, "
                        "international student organisation. It is a network of "
                        "students, graduates and young professionals who are "
                        "interested in technical and scientific fields. EESTEC is a member of the European Youth Forum and the European Students' Union.",
                        style: TextStyle(fontSize: 16),
                      ),
                    ),
                  ],
                ),
                const Center(
                  child: Text("Sponsors",
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.w500,
                        color: Colors.black,
                      )),
                ),
                Wrap(
                  children: [
                    SponsorCard(child: Image.asset("assets/sponsors/sponsor-1.png")),
                    SponsorCard(child: Image.asset("assets/sponsors/sponsor-2.png")),
                    SponsorCard(child: Image.asset("assets/sponsors/sponsor-3.png")),
                    SponsorCard(child: Image.asset("assets/sponsors/sponsor-4.png")),
                    SponsorCard(child: Image.asset("assets/sponsors/sponsor-5.png")),
                    SponsorCard(child: Image.asset("assets/sponsors/sponsor-6.png")),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SponsorCard extends StatelessWidget {
  const SponsorCard({Key? key, required this.child}) : super(key: key);
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(10),
      shape: const CircleBorder(
        side: BorderSide(color: Colors.black, width: 1),
      ),
      child: SizedBox(
        width: 100,
        height: 100,
        child: child,
      ),
    );
  }
}
