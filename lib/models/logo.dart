class Logo {
  final int id;
  final String name;
  final String type;
  final String imageURL;

  Logo({
    required this.id,
    required this.name,
    required this.type,
    required this.imageURL,
  });

  factory Logo.fromJson(Map<String, dynamic> json) {
    return Logo(
      id: json['id'],
      name: json['name'],
      type: json['type'],
      imageURL: json['imageURL'],
    );
  }
}