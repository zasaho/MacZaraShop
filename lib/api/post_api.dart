import 'package:dio/dio.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:retrofit/http.dart';
import 'package:zara_shop/models/base_model.dart';

part 'post_api.g.dart';

@RestApi(baseUrl:'https://androidsupport.ir/pack/digiAndroid/')
abstract class RestClient
{
 factory RestClient(Dio dio,{String? baseUrl})= _RestClient;

@GET("home.php")
  Future<BaseModel> getHome();
}