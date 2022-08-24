class Profile {
  String? userId;
  String? firstName;
  String? lastName;
  String? email;
  String? imageUrl;
  String? address;
  String? role;
  int? userPoints;
  List<String>? userNotification;

  Profile(
      {this.userId,
      this.firstName,
      this.lastName,
      this.email,
      this.imageUrl,
      this.address,
      this.role,
      this.userPoints,
      this.userNotification});

  
}
