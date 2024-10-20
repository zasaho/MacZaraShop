
import 'package:json_annotation/json_annotation.dart';
import 'package:zara_shop/models/product_model.dart';

import 'news_model.dart';

part 'base_model.g.dart';

@JsonSerializable()
class BaseModel
{
List<News> news;
List<Product> mobile;
List<Product> makeup;
List<Product> discount;
List<Product> AmazingOffer;



BaseModel(this.news, this.mobile,this.makeup,this.discount,this.AmazingOffer);

factory BaseModel.fromJson(Map<String, dynamic> json) => _$BaseModelFromJson(json);
Map<String, dynamic> toJson()=> _$BaseModelToJson(this);
}


