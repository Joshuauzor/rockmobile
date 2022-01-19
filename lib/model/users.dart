class User {
  User({
    required this.uuid,
    required this.email,
    this.firstName,
    this.lastName,
    this.phone,
  });

  final dynamic uuid;
  final String email;
  final String? firstName;
  final String? lastName;
  final String? phone;

  factory User.fromJson(Map<String, dynamic> json) => User(
        uuid: json['uuid'],
        email: json['email'],
        firstName: json['firstname'],
        lastName: json['lastname'],
        phone: json['email'],
      );

  // Map<String, dynamic> toJson() => {
  //   event_id
  // }
}
