import '../../domain/entities/plant.dart';

class PlantModel extends Plant {
  
  PlantModel(
      {super.plantId,
      super.name,
      super.description,
      super.imageUrl,
      super.waterCapacity,
      super.sunLight,
      super.temperature});

  PlantModel.fromJson(Map<String, dynamic> json) {
    plantId = json['plantId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    waterCapacity = json['waterCapacity'];
    sunLight = json['sunLight'];
    temperature = json['temperature'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['plantId'] = plantId;
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['waterCapacity'] = waterCapacity;
    data['sunLight'] = sunLight;
    data['temperature'] = temperature;
    return data;
  }
}