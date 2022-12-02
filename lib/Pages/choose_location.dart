import 'package:flutter/material.dart';
import 'package:http/http.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {
  const ChooseLocation({Key? key}) : super(key: key);

  @override
  State<ChooseLocation> createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  @override
  void initState() {
    super.initState();

  }

  List<WorldTime> locations = [
    WorldTime(url: 'Europe/London', location: 'London', flag: 'egypt.png'),
    WorldTime(url: 'Europe/Athens', location: 'Athens', flag: 'germany.png'),
    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Africa/Nairobi', location: 'Nairobi', flag: 'germany.png'),
    WorldTime(url: 'America/Chicago', location: 'Chicago', flag: 'egypt.png'),
    WorldTime(url: 'America/New_York', location: 'New York', flag: 'germany.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'germany.png'),
    WorldTime(url: 'Asia/Jakarta', location: 'Jakarta', flag: 'egypt.png'),
  ];

  void updateTime(int index) async
  {
    await locations[index].getTime();
    Navigator.pushReplacementNamed(context, "/home",arguments: {
      "time":locations[index].time,
      "name":locations[index].flag,
      "status":locations[index].url,
      "isDay":locations[index].isDaytime,
    });
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      appBar: AppBar(
        backgroundColor: Colors.red,
        title: Text("Choose a new Location"),
        centerTitle: true,
        elevation: 0,
      ),
      body: ListView.builder(
          itemCount: locations.length,
          itemBuilder: (context,index){
            return Card(
              child:ListTile(
                onTap: (){
                  updateTime(index);
                },
                title: Text((locations[index].location)),
                leading: CircleAvatar(
                  backgroundImage: AssetImage('assets/${locations[index].flag}'),
                ),
              )
            );
          },
      )
    );
  }
}
