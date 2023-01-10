import 'dart:collection';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:queensu/screens/food_info.dart';
import 'package:json_annotation/json_annotation.dart';

part 'food_info_model.g.dart';

@JsonSerializable()
class FoodInfoModel {
  @JsonKey(name: 'product_name')
  final String productName;
  @JsonKey(name: 'short_description')
  final String shortDescription;
  final String serving;
  final String calories;
  @JsonKey(name: 'calories_from_fat')
  final String caloriesFromFat;
  @JsonKey(name: 'total_fat')
  final String totalFat;
  @JsonKey(name: 'saturated_fat')
  final String saturatedFat;
  @JsonKey(name: 'trans_fat')
  final String transFat;
  final String cholesterol;
  final String sodium;
  @JsonKey(name: 'total_carbohydrates')
  final String totalCarbohydrates;
  @JsonKey(name: 'dietary_fiber')
  final String dietaryFiber;
  final String sugars;
  final String protein;
  @JsonKey(name: 'is_vegetarian')
  final bool isVegetarian;

  FoodInfoModel({
    required this.productName,
    required this.shortDescription,
    required this.serving,
    required this.calories,
    required this.caloriesFromFat,
    required this.totalFat,
    required this.saturatedFat,
    required this.transFat,
    required this.cholesterol,
    required this.sodium,
    required this.totalCarbohydrates,
    required this.dietaryFiber,
    required this.sugars,
    required this.protein,
    required this.isVegetarian,
  });

  factory FoodInfoModel.fromJson(Map<String, dynamic> json) =>
      _$FoodInfoModelFromJson(json);

  Map<String, dynamic> toJson() => _$FoodInfoModelToJson(this);
}
