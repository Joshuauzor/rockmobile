class Rosary {
  Rosary({
    required this.rosaryId,
    required this.rosaryUuid,
    required this.rosaryTitle,
    required this.rosaryMessage,
  });
  final int rosaryId;
  final String rosaryUuid;
  final String rosaryTitle;
  final String rosaryMessage;

  factory Rosary.fromJson(Map<String, dynamic> json) => Rosary(
        rosaryId: json['rosary_id'],
        rosaryUuid: json['rosary_uuid'],
        rosaryTitle: json['rosary_title'],
        rosaryMessage: json['rosary_message'],
      );

  Map<String, dynamic> toJson() => {
        'rosaryId': rosaryId,
        'rosaryUuid': rosaryUuid,
        'rosaryTitle': rosaryTitle,
        'rosaryMessage': rosaryMessage,
      };
}
