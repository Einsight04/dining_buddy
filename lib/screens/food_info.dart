import 'dart:collection';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:queensu/screens/meal_periods.dart';
import 'package:queensu/services/location_data.dart';

import '../models/food_info_model.dart';

Future<HashMap<String, List<FoodInfoModel>>> getFoodInfo(
    LocationAndMealPeriod info) async {
  return await LocationData().getFoodItems(info.location, info.mealPeriod);
}

class FoodInfo extends StatefulWidget {
  const FoodInfo({Key? key}) : super(key: key);

  @override
  State<FoodInfo> createState() => _FoodInfoState();
}

class _FoodInfoState extends State<FoodInfo> {
  late LocationAndMealPeriod locationAndMealPeriod;
  int calories = 0;

  @override
  Widget build(BuildContext context) {
    locationAndMealPeriod =
        ModalRoute.of(context)!.settings.arguments as LocationAndMealPeriod;

    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Food Info'),
        centerTitle: true,
        elevation: 0,
      ),
      body: FutureBuilder(
        future: getFoodInfo(locationAndMealPeriod),
        builder: (BuildContext context,
            AsyncSnapshot<HashMap<String, List<FoodInfoModel>>> snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (BuildContext context, int index) {
                String key = snapshot.data!.keys.elementAt(index);
                return ExpansionTile(
                  title: Text(key, style: const TextStyle(color: Colors.white)),
                  children: [
                    ListView.builder(
                      shrinkWrap: true,
                      itemCount: snapshot.data![key]!.length,
                      itemBuilder: (BuildContext context, int index) {
                        FoodInfoModel foodItem = snapshot.data![key]![index];
                        return ListTile(
                          title: Text(foodItem.productName,
                              style: const TextStyle(color: Colors.white)),
                          subtitle: Text(foodItem.shortDescription,
                              style: const TextStyle(color: Colors.white)),
                          trailing: TextButton(
                            onPressed: () {
                              setState(() {
                                calories += int.parse(foodItem.calories);
                              });
                            },
                            child: const Text('+',
                                style: TextStyle(color: Colors.white)),
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            );
          } else {
            return const Center(
              child: SpinKitFadingCircle(
                color: Colors.blue,
                size: 50.0,
              ),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Total Calories'),
                content: Text('You have consumed $calories calories.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}
