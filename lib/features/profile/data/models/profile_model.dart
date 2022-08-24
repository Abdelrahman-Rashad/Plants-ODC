import '../../domain/entities/profile.dart';

class ProfieModel extends Profile {
  ProfieModel(
      {super.userId,
      super.firstName,
      super.lastName,
      super.email,
      super.imageUrl,
      super.address,
      super.role,
      super.userPoints,
      super.userNotification});

      ProfieModel.fromJson(Map<String, dynamic> json) {
    userId = json['userId'];
    firstName = json['firstName'];
    lastName = json['lastName'];
    email = json['email'];
    imageUrl = json['imageUrl'];
    address = json['address'];
    role = json['role'];
    userPoints = json['UserPoints'];
    userNotification = json['UserNotification'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['userId'] = userId;
    data['firstName'] = firstName;
    data['lastName'] = lastName;
    data['email'] = email;
    data['imageUrl'] = imageUrl;
    data['address'] = address;
    data['role'] = role;
    data['UserPoints'] = userPoints;
    data['UserNotification'] = userNotification;
    return data;
  }
}