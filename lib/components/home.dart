import 'package:esclub/components/clubs.dart';
import 'package:esclub/components/announcements.dart';
import 'package:esclub/components/landing_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int _selectedIndex = 0;

  static List<Widget> pages = <Widget>[
    const Announcements(),
    const Clubs(),
    Container(color: Colors.red[900]),
  ];

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.red[900],
          centerTitle: true,
          title: const Text(
            "EsClub",
          ),
          actions: [
            IconButton(
              icon: const Icon(Icons.login),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const LandingPage()),
                );
              },
            ),
          ],
        ),
        body: pages[_selectedIndex],
        bottomNavigationBar: BottomNavigationBar(
          unselectedItemColor: Colors.black,
          selectedItemColor: Colors.red[900],
          currentIndex: _selectedIndex,
          onTap: _onItemTapped,
          items: const [
            BottomNavigationBarItem(
              icon: Icon(Icons.announcement),
              label: 'Deneme',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.people),
              label: 'Clubs',
            ),
          ],
        ),
      ),
    );
  }
}
