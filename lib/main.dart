//import 'package:first_test/edit_info.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_test/password.dart';
import 'services.dart';
import 'victim_deets.dart';
import 'edit_info.dart';
//import 'victim_list.dart';


void main() => runApp(
    MaterialApp(

        home: Home(),

      routes: {

        //'/': (context) => Loading(),

        '/home': (context) =>Home(),

        '/victim_deets': (context) => VictimDeets(),

        //'/edit_info': (context) => Wrapper(),

      },

    ),
);

class Home extends StatefulWidget {

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  CallsAndMessagesService service = CallsAndMessagesService(iceNumber) ;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
            'CallForHelp',
        style: TextStyle(
          fontFamily: 'Ubuntu',
          fontWeight: FontWeight.bold,
        ),),
        centerTitle: true,
        backgroundColor: Colors.red[900],
      ),
      body: Container(
      margin: EdgeInsets.all(20.0),
      child: Center(
        child: Column(
          children: <Widget>[
            Stack(
            children: <Widget>[
              Image(
                image: AssetImage('assets/cover.jpg'),
              ),

              Text(
          'Help people reach out for help\n.\n.\n.\nBefore it\'s too late.',
          style: TextStyle(
            fontFamily: 'Anton',
            fontSize: 20.0,
            color: Colors.white,
            //fontWeight: FontWeight.bold,

          ),
        ),
      ]
        ),


            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Column(
                children: <Widget>[
                  Container(
                  padding: EdgeInsets.symmetric(horizontal:63.0, vertical:5.0),
                  color: Colors.lightGreenAccent,
                  child: FlatButton(
                    onPressed: (){
                      service.call();
                    },
                    child: Column(
                      children: <Widget>[
                        Icon(
                      Icons.airport_shuttle,
                      color: Colors.black,
                      size: 50,
                      ),
                        Text(
                          'Call 108!',
                          style: TextStyle(
                            fontSize: 20,
                            fontFamily: 'Ubuntu',
                          ),
                        ),
                    ]
                    ),
                    color: Colors.lightGreenAccent,

                  ),

                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal:27.0,vertical:10.0),
                    child: FlatButton(
                      onPressed: (){
                        service.sendSMS();
                      },
                      child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.people_outline,
                              color: Colors.black,
                              size: 50,
                            ),
                            Text(
                              'Message ICE contacts!',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                          ]
                      ),
                      color: Colors.lightGreenAccent,

                    ),

                  ),

                  Container(
                    padding: EdgeInsets.symmetric(horizontal:40.0, vertical:3.0),
                    color: Colors.lightGreenAccent,
                    child: FlatButton(
                      onPressed: (){
                        Navigator.pushNamed(context, '/victim_deets');
                      },
                      child: Column(
                          children: <Widget>[
                            Icon(
                              Icons.local_hospital,
                              color: Colors.black,
                              size: 50,
                            ),
                            Text(
                              'Victim details',
                              style: TextStyle(
                                fontSize: 20,
                                fontFamily: 'Ubuntu',
                              ),
                            ),
                          ]
                      ),
                      color: Colors.lightGreenAccent,

                    ),

                  ),
                ],
              ),
            ),


    ]
        ),
      ),
      ),
      backgroundColor: Colors.black,
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, new MaterialPageRoute(builder: (context) => EditInfo()));
        },
        child: Center(
          child: Text(
              'Edit\ninfo',
            style: TextStyle(

            ),
          ),
        ),
        backgroundColor: Colors.red[900],
        elevation: 1.0,
      ),

    );
  }
}





