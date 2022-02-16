class ChurchPrayers {
  ChurchPrayers({
    required this.prayerId,
    required this.prayerUuid,
    required this.prayerTitle,
    required this.prayerMessage,
  });
  final int prayerId;
  final String prayerUuid;
  final String prayerTitle;
  final String prayerMessage;

  factory ChurchPrayers.fromJson(Map<String, dynamic> json) => ChurchPrayers(
        prayerId: json['prayer_id'],
        prayerUuid: json['prayer_uuid'],
        prayerTitle: json['prayer_title'],
        prayerMessage: json['prayer_message'],
      );

  Map<String, dynamic> toJson() => {
        'prayerId': prayerId,
        'prayerUuid': prayerUuid,
        'prayerTitle': prayerTitle,
        'prayerMessage': prayerMessage,
      };
}
