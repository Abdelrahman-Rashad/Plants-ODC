import 'package:get/get_connect.dart';

abstract class ProfileRepository{
  Future<Response> getuserdata();
}