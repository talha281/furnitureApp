import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:furniture_app/data/enums/gender_enum.dart';
import 'package:furniture_app/data/enums/status_enum.dart';

class UserModel extends Equatable {
  final int? id;
  final String? uid;
  final String? username;
  final String? mobileNumber;
  final Gender? gender;
  final DateTime? birthdate;
  final MaritalStatus? status;
  final String? email;
  final String? image;
  final String? address;

  UserModel({
    this.id,
    this.uid,
    this.username,
    this.mobileNumber,
    this.gender,
    this.birthdate,
    this.status,
    this.email,
    this.image,
    this.address,
  });

  @override
  List<Object?> get props => [
        id,
        uid,
        username,
        mobileNumber,
        gender,
        birthdate,
        status,
        email,
        image,
        address
      ];

  UserModel copyWith(
      {int? id,
      String? username,
      String? mobileNumber,
      Gender? gender,
      DateTime? birthdate,
      MaritalStatus? status,
      String? email,
      String? image,
      String? uid,
      String? address}) {
    return UserModel(
        uid: uid ?? this.uid,
        id: id ?? this.id,
        username: username ?? this.username,
        mobileNumber: mobileNumber ?? this.mobileNumber,
        gender: gender ?? this.gender,
        birthdate: birthdate ?? this.birthdate,
        status: status ?? this.status,
        email: email ?? this.email,
        image: image ?? this.image,
        address: address ?? this.address);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': uid,
      'username': username,
      'mobileNumber': mobileNumber,
      'gender': gender!.index,
      'birthdate': birthdate!.toString(),
      'status': status!.index,
      'email': email,
      'image': image,
      'address': address
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        uid: map['id'],
        username: map['username'],
        mobileNumber: map['mobileNumber'],
        gender: Gender.values.toList()[map['gender']],
        birthdate: DateTime.parse(map['birthdate']),
        status: MaritalStatus.values.toList()[map['status']],
        email: map['email'],
        image: map['image'],
        address: map['address']);
  }

  UserModel checkNew(UserModel old, UserModel newUser) {
    return UserModel(
        address: newUser.address ?? old.address,
        birthdate: newUser.birthdate ?? old.birthdate,
        email: newUser.email ?? old.email,
        gender: newUser.gender ?? old.gender,
        id: newUser.id ?? old.id,
        username: newUser.username ?? old.username,
        image: newUser.image ?? old.image,
        mobileNumber: newUser.mobileNumber ?? old.mobileNumber,
        status: newUser.status ?? old.status,
        uid: newUser.uid ?? old.uid);
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  bool get stringify => true;
}
