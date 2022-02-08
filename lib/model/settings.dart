class SettingsModel {
  SettingsModel({
    required this.settingsId,
    required this.email,
    this.phone,
    this.address,
    this.slug,
    this.description,
    this.privacy,
    this.terms,
    this.membership,
    this.rules,
    this.facebook,
    this.twitter,
    this.linkedIn,
    this.instagram,
    this.youtube,
  });

  final int settingsId;
  final String email;
  final dynamic phone;
  final dynamic address;
  final dynamic slug;
  final dynamic description;
  final dynamic privacy;
  final dynamic terms;
  final dynamic membership;
  final dynamic rules;
  final dynamic facebook;
  final dynamic twitter;
  final dynamic linkedIn;
  final dynamic instagram;
  final dynamic youtube;

  factory SettingsModel.fromJson(Map<String, dynamic> json) => SettingsModel(
        settingsId: json['general_settings_id'],
        email: json['email'],
        phone: json['phone'],
        address: json['address'],
        slug: json['slug'],
        description: json['description'],
        privacy: json['privacy'],
        terms: json['terms'],
        membership: json['membership'],
        rules: json['rules_regulation'],
        facebook: json['facebook'],
        twitter: json['twitter'],
        linkedIn: json['linkedIn'],
        instagram: json['instagram'],
        youtube: json['youtube'],
      );
}
