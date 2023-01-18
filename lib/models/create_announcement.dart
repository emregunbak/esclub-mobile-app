class CreateAnnouncement{
  final int clubId;
  final String title;
  final String body;

  CreateAnnouncement({
    required this.clubId,
    required this.title,
    required this.body,
  });

  factory CreateAnnouncement.fromJson(Map<String, dynamic> json) {
    return CreateAnnouncement(
      clubId: json['clubId'],
      title: json['title'],
      body: json['body'],
    );
  }
}