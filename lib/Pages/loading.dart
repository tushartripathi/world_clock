import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';



class Loading extends StatefulWidget {
  const Loading({Key? key}) : super(key: key);

  @override
  State<Loading> createState() => _LoadingState();
}

class _LoadingState extends State<Loading> {
  @override
  void initState() {
    super.initState();
    setupWorldTime();
  }

  String timeValue ="Loading......";

  Future<void> setupWorldTime() async {

    try {
      WorldTime instace = WorldTime(location: "Berlin", flag: "germany.png", url: "Europe/Berlin");
      await instace.getTime();

      Future.delayed(Duration(seconds: 4), (){
        Navigator.pushReplacementNamed(context, "/home",arguments: {
          "time":instace.time,
          "name":instace.flag,
          "status":instace.url,
          "isDay":instace.isDaytime,
        });
      });
    }
    catch(ex)
    {
      print("got error");
      print(ex.toString());
      setState(() {
        timeValue = "GOt error";
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      body: Center(
        child: SpinKitRotatingCircle(
          color: Colors.white,
          size: 50,
        ),
      )
    );
  }
}
