import 'package:equatable/equatable.dart';

class Tool extends Equatable {
  String? toolId;
  String? name;
  String? description;
  String? imageUrl;

  Tool({this.toolId, this.name, this.description, this.imageUrl});

  @override
  List<Object?> get props => [toolId, name, description, imageUrl];
}
 