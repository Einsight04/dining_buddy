import 'dart:collection';
import 'dart:convert';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:http/http.dart';
import 'package:queensu/screens/food_info.dart';
import 'package:json_annotation/json_annotation.dart';
import '../models/food_info_model.dart';

class LocationData {
  Future<HashMap<String, List<String>>> getData() async {
    Response response =
        await get(Uri.parse('${dotenv.env['API_URL']!}/locations'));

    return HashMap<String, List<String>>.from(jsonDecode(response.body)
        .map((key, value) => MapEntry(key, List<String>.from(value))));
  }

  Future<HashMap<String, List<FoodInfoModel>>> getFoodItems(
      String location, String mealPeriod) async {
    Response response = await get(
        Uri.parse('${dotenv.env['API_URL']!}/food/$location/$mealPeriod'));

    return HashMap<String, List<FoodInfoModel>>.from(jsonDecode(response.body)
        .map((key, value) => MapEntry(
            key,
            List<FoodInfoModel>.from(
                value.map((x) => FoodInfoModel.fromJson(x))))));
  }
}
