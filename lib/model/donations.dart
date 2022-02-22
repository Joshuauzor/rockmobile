class Donations {
  Donations({
    required this.donationId,
    required this.uuid,
    required this.title,
    required this.description,
    required this.price,
    required this.begin,
    required this.end,
    required this.coverImage,
  });

  final int donationId;
  final String uuid;
  final String title;
  final String description;
  final String price;
  final DateTime begin;
  final DateTime end;
  final String coverImage;

  factory Donations.fromJson(Map<String, dynamic> json) => Donations(
      donationId: json['donation_id'],
      uuid: json['uuid'],
      title: json['title'],
      description: json['description'],
      price: json['price'],
      begin: DateTime.parse(json["begin"]),
      end: DateTime.parse(json["end"]),
      coverImage: json['cover_image']);
}
