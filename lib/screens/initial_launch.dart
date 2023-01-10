import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:queensu/screens/welcome.dart';
import 'package:queensu/services/location_data.dart';

class InitialLaunch extends StatefulWidget {
  const InitialLaunch({Key? key}) : super(key: key);

  @override
  State<InitialLaunch> createState() => _InitialLaunchState();
}

class _InitialLaunchState extends State<InitialLaunch> {
  Future<void> setupUserSession() async {
    // TODO: Delete this later

    const bool loggedIn = true;

    if (!loggedIn) {
      Navigator.pushReplacementNamed(context, '/welcome');
    }

    Navigator.pushReplacementNamed(context, '/locations',
        arguments: await LocationData().getData());
  }

  @override
  void initState() {
    super.initState();
    setupUserSession();
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitChasingDots(
          color: Colors.white,
          size: 80.0,
        ),
      ),
    );
  }
}
