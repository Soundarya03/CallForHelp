import 'package:flutter/material.dart';
import 'package:first_test/password.dart';

class setIce extends StatefulWidget {
  @override
  _setIceState createState() => _setIceState();
}

class _setIceState extends State<setIce> {
  final _formKey = GlobalKey<FormState>();
  String err = '';
  String contact = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: Text(
          'Edit ICE details',
          style: TextStyle(color: Colors.white, fontFamily: 'Ubuntu'),
        ),
      ),
      body: Container(
        color: Colors.grey[400],
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Form(
              key: _formKey,
              child: Column(
                children: <Widget>[
                  SizedBox(height: 20.0,),
                  TextFormField(
                    decoration: InputDecoration(
                      hintText: 'enter ICE number',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width:2.0),
                      ),
                    ),
                    validator: (val) => val.isEmpty? 'Please enter an ICE contact number':null,
                    onChanged: (val){
                      setState(()=> contact =val);
                    },
                  ),
                  SizedBox(height: 20.0,),
                  RaisedButton(
                    color: Colors.red[900],
                    child: Text(
                      'Save ICE contact ',
                      style: TextStyle(
                        color: Colors.white,
                        //backgroundColor: Colors.red[900],
                        fontFamily: 'Ubuntu',
                      ),
                    ),
                    onPressed: ()  async{

                      if(_formKey.currentState.validate()){
                        iceNumber = contact;
                        setState(() {
                          err = 'ICE contact set successfully';
                        });

                      }


                    },
                  ),
                  SizedBox(height: 20,),
                  Text(
                    err,
                    style: TextStyle(color: Colors.red,),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
