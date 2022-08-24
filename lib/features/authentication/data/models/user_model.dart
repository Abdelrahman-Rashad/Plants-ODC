import '../../domain/entities/user.dart';

class UserModel extends User {
  const UserModel(
      {
      super.id,
      required super.firstName,
      required super.lastName,
      required super.email,
      required super.password,
      super.imageUrl});

  factory UserModel.fromJson(Map<String, dynamic> json) {
    return UserModel(
        id: json["id"] ?? "",
        firstName: json['firstName']??"",
        lastName: json['lastName']??"",
        email: json['email']??"",
        password: json['password']??"",
        imageUrl: json['imageUrl']??"");
  }

  Map<String,dynamic> toJson() {
    return {
      'id': id,
      'firstName':firstName,
      'lastName':lastName,
      'email':email,
      'password':password,
      'imageUrl':imageUrl,
    };
  }
  UserModel cloneWith({
    id,
    firstName,
    lastName,
    email,
    password,
    imageUrl,
  }) {
    return UserModel(
      id: id,
      firstName:firstName,
      lastName:lastName,
      email:email,
      password:password,
      imageUrl:imageUrl,
    );
  }
}
