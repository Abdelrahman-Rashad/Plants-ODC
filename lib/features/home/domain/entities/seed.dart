import 'package:equatable/equatable.dart';

class Seed extends Equatable{
  String? seedId;
  String? name;
  String? description;
  String? imageUrl;

  Seed({this.seedId, this.name, this.description, this.imageUrl});
  
  @override
  List<Object?> get props => [seedId, name, description, imageUrl];

  
}