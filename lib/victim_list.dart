import 'package:flutter/material.dart';
//import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:provider/provider.dart';
import 'package:first_test/victim_class.dart';
import 'package:first_test/victim_template.dart';

class VictimList1 extends StatefulWidget {
  @override
  _VictimListState1 createState() => _VictimListState1();
}

class _VictimListState1 extends State<VictimList1> {
  @override
  Widget build(BuildContext context) {
    final victims = Provider.of<List<Victim>>(context);


    return ListView.builder(
      itemCount: victims.length,
      shrinkWrap: true,
      itemBuilder: (context,index){
          return Container(
              //height: 60,
              child: VictimTemplate1(victim: victims[index]),
          );
      },
    );
  }
}

class VictimList2 extends StatefulWidget {
  @override
  _VictimList2State createState() => _VictimList2State();
}

class _VictimList2State extends State<VictimList2> {
  @override
  Widget build(BuildContext context) {
    final victims = Provider.of<List<Victim>>(context);


    return ListView.builder(
      itemCount: victims.length,
      shrinkWrap: true,
      itemBuilder: (context,index){
        return Container(
          //height: 60,
          child: VictimTemplate2(victim: victims[index]),
        );
      },
    );
  }
}


/*class Victim {
  String bloodgrp;
  String spl; //special health condn.

  Victim(String a, String b) {
    this.bloodgrp = a;
    this.spl = b;
  }
  void call() => launch("tel:$number1");
  void sendSMS() => launch("sms:$number2");

   */
