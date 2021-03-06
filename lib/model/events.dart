class EventInfo {
  EventInfo({
    required this.eventId,
    required this.uuid,
    required this.title,
    required this.venue,
    this.description,
    required this.material,
    required this.media,
    required this.startDate,
    required this.endDate,
    required this.time,
  });

  final int eventId;
  final dynamic uuid;
  final String? title;
  final String? venue;
  final String? description;
  final String? material;
  final String? media;
  final String? startDate;
  final String? endDate;
  final String? time;

  factory EventInfo.fromJson(Map<String, dynamic> json) => EventInfo(
        eventId: json['event_id'],
        uuid: json['uuid'],
        title: json['title'],
        venue: json['venue'],
        description: json['description'],
        material: json['material'],
        media: json['media'],
        startDate: json['startDate'],
        endDate: json['endDate'],
        time: json['time'],
      );

  Map<String, dynamic> toJson() => {
        'uuid': uuid,
        'email': title,
        'firstName': venue,
        'lastName': description,
        'phone': material,
        'media': media,
        'startDate': startDate,
        'endDate': endDate,
        'time': time
      };
}
