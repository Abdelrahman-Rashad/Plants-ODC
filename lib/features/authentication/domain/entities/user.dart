import 'package:equatable/equatable.dart';

class User extends Equatable{
  final String? id;
  final String firstName;
  final String lastName;
  final String email;
  final String password;
  final String? imageUrl;

  const User({this.id,required this.firstName,required this.lastName,required this.email,required this.password,this.imageUrl});
  
  @override
  List<Object?> get props => [firstName, lastName, email, password,imageUrl];
}