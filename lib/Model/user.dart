class User {
  final int id;
  final String email;
  final String firstName;
  final String lastName;
  final String avatarUrl;

  const User({
    required this.id,
    required this.email,
    required this.firstName,
    required this.lastName,
    required this.avatarUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json['data']['id'],
    email: json['data']['email'],
    firstName: json['data']['first_name'],
    lastName: json['data']['last_name'],
    avatarUrl: json['data']['avatar'],
  );
}