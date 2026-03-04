class Profile {
  final String name;
  final String email;
  final String phone;
  final String address;
  final String photoUrl;

  Profile({
    required this.name,
    required this.email,
    required this.phone,
    required this.address,
    required this.photoUrl,
  });

  factory Profile.fromJson(Map<String, dynamic> json) {
    return Profile(
      name: json['name'],
      email: json['email'],
      phone: json['phone'],
      address: json['address'],
      photoUrl: json['photoUrl'],
    );
  }
}
