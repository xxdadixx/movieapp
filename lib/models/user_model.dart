import 'dart:convert';

class UserModel {
  final String id;
  final String name;
  final String email;
  final String avatar;
  final String user;
  final String password;
  final String phone;
  final String address;
  final String lat;
  final String lng;
  UserModel({
    required this.id,
    required this.name,
    required this.email,
    required this.avatar,
    required this.user,
    required this.password,
    required this.phone,
    required this.address,
    required this.lat,
    required this.lng,
  });

  UserModel copyWith({
    String? id,
    String? name,
    String? email,
    String? avatar,
    String? user,
    String? password,
    String? phone,
    String? address,
    String? lat,
    String? lng,
  }) {
    return UserModel(
      id: id ?? this.id,
      name: name ?? this.name,
      email: email ?? this.email,
      avatar: avatar ?? this.avatar,
      user: user ?? this.user,
      password: password ?? this.password,
      phone: phone ?? this.phone,
      address: address ?? this.address,
      lat: lat ?? this.lat,
      lng: lng ?? this.lng,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'name': name,
      'email': email,
      'avatar': avatar,
      'user': user,
      'password': password,
      'phone': phone,
      'address': address,
      'lat': lat,
      'lng': lng,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      id: map['id'] ?? '',
      name: map['name'] ?? '',
      email: map['email'] ?? '',
      avatar: map['avatar'] ?? '',
      user: map['user'] ?? '',
      password: map['password'] ?? '',
      phone: map['phone'] ?? '',
      address: map['address'] ?? '',
      lat: map['lat'] ?? '',
      lng: map['lng'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'UserModel(id: $id, name: $name, email: $email, avatar: $avatar, user: $user, password: $password, phone: $phone, address: $address, lat: $lat, lng: $lng)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is UserModel &&
        other.id == id &&
        other.name == name &&
        other.email == email &&
        other.avatar == avatar &&
        other.user == user &&
        other.password == password &&
        other.phone == phone &&
        other.address == address &&
        other.lat == lat &&
        other.lng == lng;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        email.hashCode ^
        avatar.hashCode ^
        user.hashCode ^
        password.hashCode ^
        phone.hashCode ^
        address.hashCode ^
        lat.hashCode ^
        lng.hashCode;
  }
}
