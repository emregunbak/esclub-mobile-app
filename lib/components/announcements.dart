import 'dart:async';
import 'dart:convert';
import 'package:esclub/models/create_announcement.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

import '../models/announcement.dart';

List<Announcement> announcementFromJson(String str) => List<Announcement>.from(
    json.decode(str).map((x) => Announcement.fromJson(x)));

List<CreateAnnouncement> logoFromJson(String str) =>
    List<CreateAnnouncement>.from(
        json.decode(str).map((x) => CreateAnnouncement.fromJson(x)));

Future<List<Announcement>> fetchAnnouncement() async {
  final response = await http.get(Uri.parse(
      'http://esclub.eu-central-1.elasticbeanstalk.com/api/v1/announcements'));

  if (response.statusCode == 200) {
    final parsed = json
        .decode(utf8.decode(response.bodyBytes))
        .cast<Map<String, dynamic>>();
    return parsed
        .map<Announcement>((json) => Announcement.fromJson(json))
        .toList();
  } else {
    throw Exception('Failed to load album');
  }
}

class Announcements extends StatefulWidget {
  const Announcements({Key? key}) : super(key: key);

  @override
  State<Announcements> createState() => _Announcements();
}

class _Announcements extends State<Announcements> {
  Future<List<Announcement>> futureAnnouncement = fetchAnnouncement();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          onSubmitted: (String value) async {
            Response response = (await http.post(
              Uri.parse(
                  'http://esclub.eu-central-1.elasticbeanstalk.com/api/v1/announcements/create'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                'clubId': "2",
                'title': value.split(" ")[0],
                'body': value
              }),
            ));
            if (response.statusCode == 201) {
              setState(() {
                futureAnnouncement = fetchAnnouncement();
              });
            }
          },
          decoration: const InputDecoration(
            labelText: 'What do you want to announce?',
          ),
        ),
      ),
      body: FutureBuilder<List<Announcement>>(
        future: futureAnnouncement,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Container(
                  margin: const EdgeInsets.all(7),
                  decoration: BoxDecoration(
                    color: Colors.grey[200],
                    border: Border.all(color: Colors.black),
                    shape: BoxShape.rectangle,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Column(
                    children: [
                      ListTile(
                        title: Text(snapshot.data![index].club.clubName),
                        subtitle: Text(snapshot.data![index].club.shortName),
                        trailing: IconButton(
                          icon: const Icon(Icons.delete),
                          tooltip: 'Delete Announce',
                          onPressed: () async {
                            Response response = await delete(
                              Uri.parse(
                                  'http://esclub.eu-central-1.elasticbeanstalk.com/api/v1/announcements/delete/${snapshot.data![index].id}'),
                              headers: <String, String>{
                                'Content-Type':
                                'application/json; charset=UTF-8',
                              },
                            );
                            if (response.statusCode == 200) {
                              setState(() {
                                futureAnnouncement = fetchAnnouncement();
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Announce deleted')));
                            }
                          },
                        ),
                        leading: Image(
                          image: NetworkImage(
                              snapshot.data![index].club.logo.imageURL,
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          const SizedBox(
                            width: 20,
                          ),
                          Text(snapshot.data![index].body,
                              style: const TextStyle(fontSize: 17)),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                    ],
                  ),
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
