import 'package:flutter/material.dart';
import 'package:queensu/services/location_data.dart';

class LocationsAndMealPeriods {
  final String location;
  final List<String> mealPeriods;

  LocationsAndMealPeriods(this.location, this.mealPeriods);
}

class Locations extends StatefulWidget {
  const Locations({Key? key}) : super(key: key);

  @override
  State<Locations> createState() => _LocationsState();
}

class _LocationsState extends State<Locations> {
  Map<String, List<String>> locationsData = {};

  @override
  Widget build(BuildContext context) {
    locationsData = locationsData.isNotEmpty
        ? locationsData
        : ModalRoute.of(context)!.settings.arguments
            as Map<String, List<String>>;

    return Scaffold(
      backgroundColor: Colors.black26,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Choose a Location'),
        centerTitle: true,
        elevation: 0,
      ),
      body: SafeArea(
        // add list view of buttons that navigate to food screen, pass in data
        child: ListView.builder(
          itemCount: locationsData.length,
          itemBuilder: (BuildContext context, int index) {
            return Card(
              child: ListTile(
                onTap: () {
                  Navigator.pushNamed(context, '/meal_periods',
                      arguments: LocationsAndMealPeriods(
                          locationsData.keys.elementAt(index),
                          locationsData.values.elementAt(index)));
                },
                title: Text(locationsData.keys.elementAt(index)),
              ),
            );
          },
        ),
      ),
    );
  }
}
