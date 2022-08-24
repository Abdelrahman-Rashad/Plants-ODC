import 'package:get/get.dart';

abstract class HomeRepository{
  Future<Response> getProducts();
  Future<Response> getSeeds();
  Future<Response> getTools();
  Future<Response> getplants();
}