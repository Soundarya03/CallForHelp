import 'package:flutter/material.dart';
import 'package:first_test/victim_class.dart';


class VictimTemplate1 extends StatelessWidget {

  final Victim victim;
  VictimTemplate1({this.victim});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 6),
      child: Card(
        margin: EdgeInsets.fromLTRB( 18,6 ,18,0),
        color: Colors.grey[500],
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.red[400],
            radius: 26.0,
            child: Icon(Icons.person),
          ),
          title: Text(victim.name),
          subtitle: Column(
            children: <Widget>[
              Text(victim.bloodgrp),
              Text(victim.spl),
            ],
          ),
          isThreeLine: true,
          dense: true,
        ),
      ),
    );
  }
}

class VictimTemplate2 extends StatelessWidget {

  final Victim victim;
  VictimTemplate2({this.victim});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 6),
      child: Card(
        margin: EdgeInsets.fromLTRB( 18,6 ,18,0),
        color: Colors.grey[500],
        child: ListTile(
          leading: CircleAvatar(
            backgroundColor: Colors.red[400],
            radius: 26.0,
            child: Icon(Icons.person),
          ),
          trailing: IconButton(
            color: Colors.red[900],
            icon: Icon(Icons.edit),
          ),
          title: Text(victim.name),
          subtitle: Column(
            children: <Widget>[
              Text(victim.bloodgrp),
              Text(victim.spl),
            ],
          ),
          isThreeLine: true,
          dense: true,
        ),
      ),
    );
  }
}

