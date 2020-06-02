import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:first_test/database.dart';
import 'package:provider/provider.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:first_test/victim_list.dart';
import 'package:first_test/victim_class.dart';

class VictimDeets extends StatefulWidget {
  @override
  _VictimDeetsState createState() => _VictimDeetsState();
}

class _VictimDeetsState extends State<VictimDeets> {

  //String result = "";

  @override
  Widget build(BuildContext context) {
    return StreamProvider<List<Victim>>.value(
      value: DatabaseServiceVictim().victims,
    child: Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: Text(
            'Victim details',
            style: TextStyle(
              fontFamily: 'Ubuntu',
              fontWeight: FontWeight.bold,
            ),
        ),
        centerTitle: true,
      ),
      backgroundColor: Colors.grey[400],
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container(
                      padding: EdgeInsets.fromLTRB(20,20, 37, 20) ,
                      //margin: EdgeInsets.fromLTRB(10, 0, 10, 0),
                      color: Colors.red[900] ,
                      child: Text(
                        'Critical information that can make all the difference.',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Ubuntu',
                        ),

                      ),
                    ),
                  ),
                ],
              ),
              /*Column(
                children: victims.map((victim) => victimTemplate(victim) ).toList() ,

              ),*/
              VictimList1(),
            ],
          ),
      ),
      

    )
    );
  }
}
