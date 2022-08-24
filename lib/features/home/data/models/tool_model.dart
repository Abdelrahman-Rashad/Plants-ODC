
import 'package:plants_odc/features/home/domain/entities/tool.dart';

import '../../domain/entities/tool.dart';

class ToolModel extends Tool {
  
  ToolModel({super.toolId, super.name, super.description, super.imageUrl});


  ToolModel.fromJson(Map<String, dynamic> json) {
    toolId = json['toolId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['toolId'] = toolId;
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    return data;
  }
}

