import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:http/http.dart' as http;

import '../models/club.dart';
import '../models/logo.dart';
import 'club_details.dart';

List<Club> clubFromJson(String str) =>
    List<Club>.from(json.decode(str).map((x) => Club.fromJson(x)));

List<Logo> logoFromJson(String str) =>
    List<Logo>.from(json.decode(str).map((x) => Logo.fromJson(x)));





Future<List<Club>> fetchClub() async {
  final response =
      await http.get(Uri.parse('http://esclub.eu-central-1.elasticbeanstalk.com/api/v1/clubs'));

  if (response.statusCode == 200) {
    final parsed = json.decode(utf8.decode(response.bodyBytes)).cast<Map<String, dynamic>>();
    return parsed.map<Club>((json) => Club.fromJson(json)).toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class Clubs extends StatefulWidget {
  const Clubs({Key? key}) : super(key: key);

  @override
  State<Clubs> createState() => _ClubsState();
}

class _ClubsState extends State<Clubs> {
  late Future<List<Club>> futureClub;

  @override
  void initState() {
    super.initState();
    futureClub = fetchClub();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder<List<Club>>(
        future: futureClub,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(snapshot.data![index].clubName),
                  subtitle: Text(snapshot.data![index].shortName),
                  leading: Image.network(snapshot.data![index].logo.imageURL),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ClubDetails(
                          club: snapshot.data![index],
                        ),
                      ),
                    );
                  },
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
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
