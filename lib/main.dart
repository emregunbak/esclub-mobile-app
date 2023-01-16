import 'package:esclub/components/club_details.dart';
import 'package:esclub/components/clubs.dart';
import 'package:esclub/components/landing_page.dart';
import 'package:esclub/components/welcome_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'components/login.dart';


void main() {
  runApp(const ProviderScope(
      child: MyApp())
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // int _selectedIndex = 0;

  // static List<Widget> pages = <Widget>[
  //   const LandingPage(),
  //   const Clubs(),
  //   const ClubDetails(),
  //   Container(color: Colors.red[900]),
  // ];

  // void _onItemTapped(int index) {
  //   setState(() {
  //     _selectedIndex = index;
  //   });
  // }

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Scaffold(
        // appBar: AppBar(
        //   backgroundColor: Colors.red[900],
        //   centerTitle: true,
        //   title: const Text(
        //       "EsClub",
        //   ),
        //   actions: [
        //     IconButton(
        //       icon: const Icon(Icons.login),
        //       onPressed: () {
        //         Navigator.push(
        //           context,
        //           MaterialPageRoute(builder: (context) => const Login()),
        //         );
        //       },
        //     ),
        //   ],
        // ),
        body: LandingPage(),


        // bottomNavigationBar: BottomNavigationBar(
        //   unselectedItemColor: Colors.black,
        //   selectedItemColor: Colors.red[900],
        //   currentIndex: _selectedIndex,
        //   onTap: _onItemTapped,
        //   items: const [
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.home),
        //       label: 'Home',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.announcement),
        //       label: 'Announcements',
        //     ),
        //     BottomNavigationBarItem(
        //       icon: Icon(Icons.people),
        //       label: 'Clubs',
        //     ),
        //   ],
        // ),
      ),
    );
  }
}
