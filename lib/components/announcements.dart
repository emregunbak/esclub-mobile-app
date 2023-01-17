import 'dart:async';
import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:http/http.dart';

List<Post> postFromJson(String str) =>
    List<Post>.from(json.decode(str).map((x) => Post.fromMap(x)));

class Post {
  Post({required this.id, required this.title, required this.body});

  int id;
  String? title;
  String body;

  factory Post.fromMap(Map<String, dynamic> json) => Post(
        id: json["id"],
        title: json["title"],
        body: json["body"],
      );
}

Future<List<Post>> fetchPost() async {
  final response =
      await http.get(Uri.parse('http://10.0.2.2:8080/api/v1/announcements'));

  if (response.statusCode == 200) {
    final parsed = json.decode(response.body).cast<Map<String, dynamic>>();
    return parsed.map<Post>((json) => Post.fromMap(json)).toList();
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
  Future<List<Post>> futurePost = fetchPost();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: TextField(
          onSubmitted: (String value) async {
            Response response = await post(
              Uri.parse('http://10.0.2.2:8080/api/v1/announcements/create'),
              headers: <String, String>{
                'Content-Type': 'application/json; charset=UTF-8',
              },
              body: jsonEncode(<String, String>{
                'clubId': "5",
                'title': value.split(" ")[0],
                'body': value
              }),
            );
            if (response.statusCode == 201) {
              setState(() {
                futurePost = fetchPost();
              });
            }
          },
          decoration: const InputDecoration(
            labelText: 'What do you want to announce?',
          ),
        ),
      ),
      body: FutureBuilder<List<Post>>(
        future: futurePost,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (_, index) => Container(
                margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                padding: const EdgeInsets.all(15.0),
                decoration: BoxDecoration(
                  color: Colors.red,
                  borderRadius: BorderRadius.circular(15.0),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                            width: 40.0,
                            height: 40.0,
                            decoration: const BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.fill,
                                    image: AssetImage(
                                      "assets/esclub-logo.png",
                                    )))),
                        Text(
                          " ${snapshot.data![index].title}",
                          style: const TextStyle(
                              fontSize: 18.0,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          tooltip: 'Delete Announce',
                          onPressed: () async {
                            Response response = await delete(
                              Uri.parse(
                                  'http://10.0.2.2:8080/api/v1/announcements/delete/${snapshot.data![index].id}'),
                              headers: <String, String>{
                                'Content-Type':
                                    'application/json; charset=UTF-8',
                              },
                            );
                            if (response.statusCode == 200) {
                              setState(() {
                                futurePost = fetchPost();
                              });
                              ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                      content: Text('Announce deleted')));
                            }
                          },
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      snapshot.data![index].body,
                      style: const TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            );
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        },
      ),
    );
  }
}
