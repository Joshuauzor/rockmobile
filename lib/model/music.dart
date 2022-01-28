class Music {
  Music({
    required this.sermonId,
    required this.uuid,
    required this.coverImage,
    required this.title,
    required this.description,
    required this.media,
    required this.mediaType,
    required this.author,
  });

  final int sermonId;
  final dynamic uuid;
  final String coverImage;
  final String title;
  final String description;
  final String media;
  final String mediaType;
  final String author;

  factory Music.fromJson(Map<String, dynamic> json) => Music(
        sermonId: json['sermon_id'],
        uuid: json['uuid'],
        coverImage: json['cover_image'],
        title: json['title'],
        description: json['description'],
        media: json['media'],
        mediaType: json['media_type'],
        author: json['author'],
      );

  Map<String, dynamic> toJson() => {
        'sermonId': sermonId,
        'uuid': uuid,
        'coverImage': coverImage,
        'media': media,
        'author': author,
      };
}
