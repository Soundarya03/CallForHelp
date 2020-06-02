import 'package:flutter/material.dart';
import 'package:first_test/password.dart';

class SetPassword extends StatefulWidget {

  @override
  _SetPasswordState createState() => _SetPasswordState();
}

class _SetPasswordState extends State<SetPassword> {
  final _formKey = GlobalKey<FormState>();
  String err = '';
  String password = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.red[600],
        title: Text(
          'Set a new password',
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
                      hintText: 'enter new password',
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.black, width:2.0),
                      ),
                    ),
                    obscureText: true,
                    validator: (val) => val.isEmpty? 'Please set a password':null,
                    onChanged: (val){
                      setState(()=> password =val);
                    },
                  ),
                  SizedBox(height: 20.0,),
                  RaisedButton(
                    color: Colors.red[900],
                    child: Text(
                      'Save password ',
                      style: TextStyle(
                        color: Colors.white,
                        //backgroundColor: Colors.red[900],
                        fontFamily: 'Ubuntu',
                      ),
                    ),
                    onPressed: ()  async{

                      if(_formKey.currentState.validate()){
                        setpassword = password;
                        setState(() {
                          err = 'password set successfully';
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
