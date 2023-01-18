import 'club.dart';

class Announcement {
  final int id;
  final Club club;
  final String title;
  final String body;

  Announcement({
    required this.id,
    required this.club,
    required this.title,
    required this.body,
  });

  factory Announcement.fromJson(Map<String, dynamic> json) {
    return Announcement(
      id: json['id'],
      club: Club.fromJson(json['club']),
      title: json['title'],
      body: json['body'],
    );
  }
}