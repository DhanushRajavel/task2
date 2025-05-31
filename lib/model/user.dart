import 'package:hive/hive.dart';

part '../user.g.dart';

@HiveType(typeId: 0)
class User extends HiveObject {
  @HiveField(0) final String gender;
  @HiveField(1) final String title;
  @HiveField(2) final String firstName;
  @HiveField(3) final String lastName;
  @HiveField(4) final String street;
  @HiveField(5) final String city;
  @HiveField(6) final String state;
  @HiveField(7) final String country;
  @HiveField(8) final String pictureUrl;

  User({
    required this.gender,
    required this.title,
    required this.firstName,
    required this.lastName,
    required this.street,
    required this.city,
    required this.state,
    required this.country,
    required this.pictureUrl,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      gender: json['gender'],
      title: json['name']['title'],
      firstName: json['name']['first'],
      lastName: json['name']['last'],
      street: '${json['location']['street']['number']} ${json['location']['street']['name']}',
      city: json['location']['city'],
      state: json['location']['state'],
      country: json['location']['country'],
      pictureUrl: json['picture']['large'],
    );
  }
}
