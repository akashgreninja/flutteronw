import 'package:flutter/material.dart';
import 'package:world_time/services/world_time.dart';

class ChooseLocation extends StatefulWidget {


  @override
  _ChooseLocationState createState() => _ChooseLocationState();
}

class _ChooseLocationState extends State<ChooseLocation> {

  List<WorldTime> locations = [

    WorldTime(url: 'Africa/Cairo', location: 'Cairo', flag: 'egypt.png'),
    WorldTime(url: 'Asia/Seoul', location: 'Seoul', flag: 'south_korea.png'),

  ];


void updateTime(index) async{
  WorldTime instance = locations[index];
  await instance.getTime();

  Navigator.pop(context,{
    'location':instance.location,
    'flag':instance.flag,
    'time':instance.time,
    'isDayTime':instance.isDayTime,


  });


}

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      backgroundColor: Colors.grey,
      appBar: AppBar(
        backgroundColor: Colors.blue[900],
        title: Text('choose location'),
        centerTitle: true,
        elevation: 0 ,
      ),

      body:ListView.builder(itemCount: locations.length,
      itemBuilder: (context,index){


        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 1.0,horizontal:4.0),
          child: Card(
            child: ListTile(
              onTap: () {
                updateTime(index);
              } ,
              title: Text(locations[index].location , style: TextStyle(
                fontWeight: FontWeight.bold,letterSpacing: 2.0
              ),),
              leading: CircleAvatar(
                backgroundImage: AssetImage('assets/${locations[index].flag}'),
              ),
            ),

          ),
        );
      }


      ),
      );


  }
}
