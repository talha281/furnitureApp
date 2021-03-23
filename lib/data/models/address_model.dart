import 'dart:convert';

class AddressModel {
  final int? id;
  final String? userName;
  final String? mobileNumber;
  final String? pinCode;
  final String? deliveryAddress;
  final String? deliveryArea;
  final String? landMark;
  final String? city;

  AddressModel({
    this.id,
    this.userName,
    this.mobileNumber,
    this.pinCode,
    this.deliveryAddress,
    this.deliveryArea,
    this.landMark,
    this.city,
  });

  AddressModel copyWith({
    int? id,
    String? userName,
    String? mobileNumber,
    String? pinCode,
    String? deliveryAddress,
    String? deliveryArea,
    String? landMark,
    String? city,
  }) {
    return AddressModel(
      id: id ?? this.id,
      userName: userName ?? this.userName,
      mobileNumber: mobileNumber ?? this.mobileNumber,
      pinCode: pinCode ?? this.pinCode,
      deliveryAddress: deliveryAddress ?? this.deliveryAddress,
      deliveryArea: deliveryArea ?? this.deliveryArea,
      landMark: landMark ?? this.landMark,
      city: city ?? this.city,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'userName': userName,
      'mobileNumber': mobileNumber,
      'pinCode': pinCode,
      'deliveryAddress': deliveryAddress,
      'deliveryArea': deliveryArea,
      'landMark': landMark,
      'city': city,
    };
  }

  factory AddressModel.fromMap(Map<String, dynamic>? map) {
   

    return AddressModel(
      id: map!['id'],
      userName: map['userName'],
      mobileNumber: map['mobileNumber'],
      pinCode: map['pinCode'],
      deliveryAddress: map['deliveryAddress'],
      deliveryArea: map['deliveryArea'],
      landMark: map['landMark'],
      city: map['city'],
    );
  }

  String toJson() => json.encode(toMap());

  factory AddressModel.fromJson(String source) =>
      AddressModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'AddressModel(id: $id, userName: $userName, mobileNumber: $mobileNumber, pinCode: $pinCode, deliveryAddress: $deliveryAddress, deliveryArea: $deliveryArea, landMark: $landMark, city: $city)';
  }

  @override
  bool operator ==(Object o) {
    if (identical(this, o)) return true;

    return o is AddressModel &&
        o.id == id &&
        o.userName == userName &&
        o.mobileNumber == mobileNumber &&
        o.pinCode == pinCode &&
        o.deliveryAddress == deliveryAddress &&
        o.deliveryArea == deliveryArea &&
        o.landMark == landMark &&
        o.city == city;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        userName.hashCode ^
        mobileNumber.hashCode ^
        pinCode.hashCode ^
        deliveryAddress.hashCode ^
        deliveryArea.hashCode ^
        landMark.hashCode ^
        city.hashCode;
  }
}
