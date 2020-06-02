import 'package:first_test/edit_ICE.dart';
import 'package:first_test/victim_list.dart';
import 'package:flutter/material.dart';
import 'package:first_test/auth.dart';
import 'package:first_test/database.dart';
import 'package:first_test/edit_password.dart';
import 'package:provider/provider.dart';
import 'package:first_test/victim_class.dart';

class AcceptChanges extends StatefulWidget {

  @override
  _AcceptChangesState createState() => _AcceptChangesState();
}

class _AcceptChangesState extends State<AcceptChanges> {
  final AuthService _auth = AuthService();

  String msg ='';

  @override
  Widget build(BuildContext context) {

    //final victimsx = Provider.of<List<Victim>>(context);

    return StreamProvider<List<Victim>>.value(

        value: DatabaseServiceVictim().victims,
    child: Scaffold(
      backgroundColor: Colors.grey[400],
      appBar: AppBar(
          elevation: 0.0,
          backgroundColor: Colors.red[600],
        actions: <Widget>[
          FlatButton(
            child: Text(
              '* Set password',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: (){
              Navigator.push(context, new MaterialPageRoute(builder: (context) => SetPassword()));
            },
              ),
        ],
      ),
      body: Padding(
        padding: EdgeInsets.fromLTRB(10, 10, 10, 10),
        child: Center(
          child: Column(
            children: <Widget>[
              RaisedButton(
                  onPressed: () async {
                    Navigator.push(context, new MaterialPageRoute(builder: (context) => setIce()));

                  },
                  color: Colors.grey[500],
                  child: Row(
                    children: <Widget>[
                      Icon(
                        Icons.add_call,
                        color: Colors.red[900],
                      ),
                      SizedBox(width: 5,),
                      Text(
                        'Change ICE contact',
                        style: TextStyle(color: Colors.white),
                      )
                    ],
                  )
              ),
              SizedBox(height: 4,),
              VictimList2(),
              SizedBox(height: 8,),
              RaisedButton(
                onPressed: () async {
                  //create a new victim
                  await DatabaseServiceVictim(vid :'${(DatabaseServiceVictim().victims.length)}').updateVictimDetail('xxx','O+ve','Nil');
                  setState(() {
                    msg = 'Record succesfully created.';
                  });
                },
                color: Colors.red[900],
                child: Row(
                  children: <Widget>[
                    Icon(
                      Icons.add,
                      color: Colors.white,
                    ),
                    SizedBox(width: 4,),
                    Text(
                      'Add new person',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )
              ),
              SizedBox(
                height: 3,
              ),
              Text(
                msg,

              ),
            ],
          ),
        ),
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: ()async{
            await _auth.signOut();
        },
        backgroundColor: Colors.red[900],
        child: Text(
          'Sign\n Out',
        ),

      ),
    )
    );
  }
}
