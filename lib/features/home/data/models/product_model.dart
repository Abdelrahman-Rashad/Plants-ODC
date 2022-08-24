import 'package:plants_odc/features/home/domain/entities/product.dart';
class ProductModel extends Product {
  
  ProductModel(
      {super.productId,
      super.name,
      super.description,
      super.imageUrl,
      super.type,
      super.price,
      super.available,
      super.item});

  ProductModel.fromJson(Map<String, dynamic> json) {
    productId = json['productId'];
    name = json['name'];
    description = json['description'];
    imageUrl = json['imageUrl'];
    type = json['type'];
    price = json['price'];
    available = json['available'];
    if(json['type']=="SEED") {
      item = json['seed'];
    }else if(json['type']=="PLANT"){
      item = json['plant'];
    }else{
      item = json['tool'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['productId'] = productId;
    data['name'] = name;
    data['description'] = description;
    data['imageUrl'] = imageUrl;
    data['type'] = type;
    data['price'] = price;
    data['available'] = available;
    if(type=="SEED") {
      data['seed']=item;
    }else if(type=="PLANT"){
      data['plant']=item;
    }else{
      data['tool']=item;
    }
    return data;
  }
}