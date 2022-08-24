import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:plants_odc/features/home/data/models/plant_model.dart';
import 'package:plants_odc/features/home/data/models/seed_model.dart';
import 'package:plants_odc/features/home/data/models/tool_model.dart';
import 'package:plants_odc/features/home/domain/usecases/get_products.dart';
import 'package:plants_odc/features/home/domain/usecases/get_seeds.dart';

import '../../data/models/product_model.dart';
import '../../domain/usecases/get_plants.dart';
import '../../domain/usecases/get_tools.dart';

class HomeController extends GetxController{
  List<SeedModel> seeds=<SeedModel>[].obs;
  var products=<ProductModel>[].obs;
  var plants=<PlantModel>[].obs;
  List<ToolModel> tools=<ToolModel>[].obs;
  var foundproduct= <ProductModel>[].obs;
  var cartofitems=<dynamic>[].obs;
  final GetSeedsUseCase seedsusecase;
  final GetProductsUseCase productsusecase;
  final GetToolsUseCase toolsusecase;
  final GetPlantsUseCase plantsusecase;
  RxBool isloaded=false.obs;
  PageController mypage=PageController(initialPage: 2);
  RxInt totalPrice=0.obs;
  var countItems=<RxInt>[].obs;


  HomeController({required this.seedsusecase,required this.toolsusecase,required this.plantsusecase,required this.productsusecase});

  @override
  void onInit() {
    getProductsController();
    getSeedsController();
    getToolsController();
    getPlantsController();
    isloaded=true.obs;
    // ignore: invalid_use_of_protected_member
    foundproduct.value=products.value;
    super.onInit();
  }

  void changemypage(int index) {
    mypage.jumpToPage(index);
  }

  void addItemToCart(dynamic item){
    cartofitems.add(item);
    countItems.add(1.obs);
    totalPrice+=item.price;
  }
  void deleteItemFromCart(dynamic item){
    final index=cartofitems.indexWhere((element) => element.name==item.name);
    totalPrice-=(countItems[index]*item.price)as int;
    cartofitems.removeAt(index);
    countItems.removeAt(index);
  }

  void incrementcount(item){
    final index=cartofitems.indexWhere((element) => element.name==item.name);
    countItems[index].value+=1;
    totalPrice+=item.price;
  }
  void decrementCount(item){
    final index=cartofitems.indexWhere((element) => element.name==item.name);
    if(countItems[index].value>0) {
      countItems[index].value-=1;
    }
    totalPrice-=item.price;
  }

  List<SeedModel> getSeedsController(){
    try{
      seedsusecase.execute().then((value) {
        for(var item in value.body["data"])
        {
          seeds.add(SeedModel.fromJson(item));
        }
      });
    }catch(e){
      // ignore: avoid_print
      print(e);
    }
    return seeds;

  }
  List<ProductModel> getProductsController(){
    try{
      productsusecase.execute().then((value) {
        for(var item in value.body["data"])
        {
          products.add(ProductModel.fromJson(item));
        }
      });
    }catch(e){
      // ignore: avoid_print
      print(e);
    }
    return products;

  }
  List<ToolModel> getToolsController(){
    try{
      toolsusecase.execute().then((value) {
        for(var item in value.body["data"])
        {
          tools.add(ToolModel.fromJson(item));
        }
      });
    }catch(e){
      // ignore: avoid_print
      print(e);
    }
    return tools;

  }
  List<PlantModel> getPlantsController(){
          var temp=<PlantModel>[];

    try{
      plantsusecase.execute().then((value) {
        for(var item in value.body["data"])
        {
          temp.add(PlantModel.fromJson(item));
        }
      });
    }catch(e){
      // ignore: avoid_print
      print(e);
    }
    plants.value=temp;
    return plants;

  }

  void searchproduct(String query){
    var Product= <ProductModel>[].obs;
    if(query.isEmpty){
      Product=products;
    }else{
    Product=products.where((item) {
    final titlelower=item.name!.toLowerCase();
    final searchlower=query.toLowerCase();
    return titlelower.contains(searchlower);
    }
    ).toList().obs;
    }
    foundproduct.value=Product;
  }
  
}