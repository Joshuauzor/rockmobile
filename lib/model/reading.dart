class DailyReading {
  DailyReading({
    required this.uuid,
    required this.reflectionId,
    required this.rosary,
    required this.vestment,
    required this.dayTag,
    required this.useDate,
    required this.firstReadingTopic,
    required this.firstKeyVerse,
    required this.firstReadingVerse,
    required this.firstReading,
    required this.gospelReadingTopic,
    required this.gospelKeyVerse,
    required this.gospelReadingVerse,
    required this.gospelReading,
    this.secondReadingTopic,
    this.secondKeyVerse,
    this.secondReadingVerse,
    this.secondReading,
    required this.daySaint,
    required this.response,
    required this.responsorialVerse,
    required this.responsorialPsalms,
    required this.acclaimation,
    required this.reflection,
    required this.coverImage,
  });

  final String uuid;
  final int reflectionId;
  final String rosary;
  final String vestment;
  final String dayTag;
  final String useDate;
  final String firstReadingTopic;
  final String firstKeyVerse;
  final String firstReadingVerse;
  final String firstReading;
  final String gospelReadingTopic;
  final String gospelKeyVerse;
  final String gospelReadingVerse;
  final String gospelReading;
  final String? secondReadingTopic;
  final String? secondKeyVerse;
  final String? secondReadingVerse;
  final String? secondReading;
  final String daySaint;
  final String response;
  final String responsorialVerse;
  final String responsorialPsalms;
  final String acclaimation;
  final String reflection;
  final String coverImage;

  factory DailyReading.fromJson(Map<String, dynamic> json) => DailyReading(
        uuid: json['uuid'],
        reflectionId: json['reflection_id'],
        rosary: json['rosary'],
        vestment: json['vestment'],
        dayTag: json['day_tag'],
        useDate: json['use_date'],
        firstReadingTopic: json['first_reading_topic'],
        firstKeyVerse: json['first_key_verse'],
        firstReadingVerse: json['first_reading_verse'],
        firstReading: json['first_reading'],
        gospelReadingTopic: json['gospel_reading_topic'],
        gospelKeyVerse: json['gospel_key_verse'],
        gospelReadingVerse: json['gospel_reading_verse'],
        gospelReading: json['gospel_reading'],
        secondReadingTopic: json['second_reading_topic'],
        secondKeyVerse: json['second_key_verse'],
        secondReadingVerse: json['second_reading_verse'],
        secondReading: json['second_reading'],
        daySaint: json['day_saint'],
        response: json['response'],
        responsorialVerse: json['responsorial_verse'],
        responsorialPsalms: json['responsorial_psalms'],
        acclaimation: json['acclaimation'],
        reflection: json['reflection'],
        coverImage: json['cover_image'],
      );
}
