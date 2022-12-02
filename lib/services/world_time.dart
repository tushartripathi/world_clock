import 'dart:convert';
import 'package:http/http.dart';
import 'package:intl/intl.dart';

class WorldTime
{
   String location; // loation name
   late String time;
   String flag; // url for location flag icon
   String url;
   late bool isDaytime;

  WorldTime({required this.location, required this.flag,required this.url});

  Future<void> getTime() async {
    Response response = await get(Uri.http("worldtimeapi.org","/api/timezone/$url"));
    Map data = jsonDecode(response.body);

    DateTime dateTime = DateTime.parse(data['datetime']);
    dateTime = dateTime.add(Duration(hours: int.parse(data['utc_offset'].substring(1,3))));

    //time = dateTime.toString();
    time = DateFormat.jm().format(dateTime);
    //isDaytime= dateTime.hour>6 && dateTime.hour < 19 ? true : false;
    isDaytime = false;

  }
}
