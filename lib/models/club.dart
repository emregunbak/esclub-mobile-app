import 'logo.dart';

class Club {
  final int id;
  final String clubName;
  final String shortName;
  final Logo logo;

  Club({
    required this.id,
    required this.clubName,
    required this.shortName,
    required this.logo,
  });

  factory Club.fromJson(Map<String, dynamic> json) {
    return Club(
      id: json['id'],
      clubName: json['clubName'],
      shortName: json['shortName'],
      logo: Logo.fromJson(json['logo']),
    );
  }
}