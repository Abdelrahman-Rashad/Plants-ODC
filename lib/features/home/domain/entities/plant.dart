import 'package:equatable/equatable.dart';

class Plant extends Equatable{
  String? plantId;
  String? name;
  String? description;
  String? imageUrl;
  int? waterCapacity;
  int? sunLight;
  int? temperature;

  Plant(
      {this.plantId,
      this.name,
      this.description,
      this.imageUrl,
      this.waterCapacity,
      this.sunLight,
      this.temperature});
      
        @override
        List<Object?> get props => [plantId,name,description,imageUrl, waterCapacity, sunLight, temperature];

  
}