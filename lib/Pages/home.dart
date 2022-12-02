import 'package:flutter/material.dart';


class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  
  Map data = {};
  @override
  void initState() {
    super.initState();
    
  }
  
  @override
  Widget build(BuildContext context) {
    
    data = ModalRoute.of(context)?.settings.arguments as Map;
    
    return Scaffold(
      body: SafeArea(child: Column(children: <Widget>[
        Padding(
          padding: const EdgeInsets.fromLTRB(0,80,0,0),
          child: TextButton.icon(
              onPressed:(){
                Navigator.pushNamed(context,"/location");
              },
              icon: Icon(Icons.edit_location,color: Colors.indigo,),
              label: Text("Edit Location",
                      style: TextStyle(
                        color: Colors.indigo
                      ),
              )
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

            Text(
              data['isDay'].toString(),
              style: TextStyle(
                fontSize: 20.0,
                letterSpacing: 1.0,
                color: Colors.black54
              ),
            ),
          ],
        ),
        SizedBox(height: 20,),
        Padding(
          padding: const EdgeInsets.fromLTRB(0,40,0,0),
          child: Text(
            data['time'],
            style: TextStyle(
              fontSize: 50.0,
              fontWeight: FontWeight.w400,
              color: Colors.black
            ) ,),
        ),

      ],)),
    );
  }
}

