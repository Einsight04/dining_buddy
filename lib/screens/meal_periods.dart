import 'package:flutter/material.dart';
import 'locations.dart';

class LocationAndMealPeriod {
  final String location;
  final String mealPeriod;

  LocationAndMealPeriod(this.location, this.mealPeriod);
}

class MealPeriods extends StatefulWidget {
  const MealPeriods({Key? key}) : super(key: key);

  @override
  State<MealPeriods> createState() => _MealPeriodsState();
}

class _MealPeriodsState extends State<MealPeriods> {
  late LocationsAndMealPeriods locationsData;

  @override
  Widget build(BuildContext context) {
    locationsData =
        ModalRoute.of(context)!.settings.arguments as LocationsAndMealPeriods;

    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(locationsData.location),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        child: ListView.builder(
          itemCount: locationsData.mealPeriods.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/food_info',
                      arguments: LocationAndMealPeriod(locationsData.location,
                          locationsData.mealPeriods[index]));
                },
                title: Text(locationsData.mealPeriods[index]),
              ),
            );
          },
        ),
      ),
    );
  }
}
