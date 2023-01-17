import 'package:flutter/material.dart';

class Announcements extends StatefulWidget {
  const Announcements({Key? key}) : super(key: key);

  @override
  State<Announcements> createState() => _AnnouncementsState();
}

class _AnnouncementsState extends State<Announcements> {
  var moviesTitles = ['User 1', 'User 2', 'User 3'];
  _myFunction() => print("Being pressed!");
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(8),
      child: Column(
        children: <Widget>[
          TextField(
            onSubmitted: (String value) {
              setState(() {
                moviesTitles.add(value);
              });
            },
            decoration: InputDecoration(
              border: OutlineInputBorder(),
              labelText: 'Ne duyurmak istersin?',
            ),
          ),
          Card(
            margin: const EdgeInsets.all(12),
            child: SizedBox(
              width: double.infinity,
              height: 65,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  toolbarHeight: 65,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  leading: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/esclub-logo.png",
                        width: 40.0,
                      ),
                    ],
                  ),
                  title: Text(
                    moviesTitles[moviesTitles.length - 1],
                    style: TextStyle(color: Colors.black),
                  ),
                  actions: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.black,
                          ),
                          tooltip: 'Show Snackbar',
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Announce deleted')));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          Card(
            margin: const EdgeInsets.all(12),
            child: SizedBox(
              width: double.infinity,
              height: 65,
              child: Scaffold(
                appBar: AppBar(
                  backgroundColor: Colors.white,
                  toolbarHeight: 65,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                  leading: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Image.asset(
                        "assets/esclub-logo.png",
                        width: 40.0,
                      ),
                    ],
                  ),
                  title: Text(
                    moviesTitles[1],
                    style: TextStyle(color: Colors.black),
                  ),
                  actions: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        IconButton(
                          icon: const Icon(
                            Icons.delete,
                            color: Colors.black,
                          ),
                          tooltip: 'Show Snackbar',
                          onPressed: () {
                            ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                    content: Text('Announce deleted')));
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
