
import 'package:plants_odc/features/home/domain/entities/seed.dart';

class SeedModel extends Seed {
  
    SeedModel({super.seedId, super.name, super.description, super.imageUrl});


  SeedModel.fromJson(Map<String, dynamic> json) {
    seedId = json['seedId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['seedId'] = seedId;
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    return data;
  }
}