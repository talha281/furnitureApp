import 'dart:convert';
import 'package:equatable/equatable.dart';
import 'package:furniture_app/data/enums/gender_enum.dart';
import 'package:furniture_app/data/enums/status_enum.dart';

class UserModel extends Equatable {
  final int? id;
  final String? uid;
  final String? username;
  final String? mobileNumber;
  final String? email;
  final String? image;

  UserModel({
    this.id,
    this.uid,
    this.username,
    this.mobileNumber,
    this.email,
    this.image,
  });

  @override
  List<Object?> get props => [
        id,
        uid,
        username,
        mobileNumber,
        email,
        image,
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
        email: email ?? this.email,
        image: image ?? this.image,);
  }

  Map<String, dynamic> toMap() {
    return {
      'id': uid,
      'username': username,
      'mobileNumber': mobileNumber,
      'email': email,
      'image': image,
    };
  }

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
        uid: map['id'],
        username: map['username'],
        mobileNumber: map['mobileNumber'],
        email: map['email'],
        image: map['image'],);
  }

  UserModel checkNew(UserModel old, UserModel newUser) {
    return UserModel(
        email: newUser.email ?? old.email,
        id: newUser.id ?? old.id,
        username: newUser.username ?? old.username,
        image: newUser.image ?? old.image,
        mobileNumber: newUser.mobileNumber ?? old.mobileNumber,
        uid: newUser.uid ?? old.uid);
  }

  String toJson() => json.encode(toMap());

  factory UserModel.fromJson(String source) =>
      UserModel.fromMap(json.decode(source));

  @override
  bool get stringify => true;
}
