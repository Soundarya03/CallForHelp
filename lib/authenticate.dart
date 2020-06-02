import 'package:first_test/accept_changes.dart';
import 'package:first_test/password.dart';
import 'package:first_test/auth.dart';
import 'package:flutter/material.dart';
import 'package:first_test/loading.dart';

class Authenticate extends StatefulWidget {
  @override
  _AuthenticateState createState() => _AuthenticateState();
}

class _AuthenticateState extends State<Authenticate> {

  final AuthService _auth = AuthService();
  final _formKey = GlobalKey<FormState>();
  bool load = false;

  //to store password
  String password = '';
  //String setpassword = 'abc123';
  String err = ''; //error

  @override
  Widget build(BuildContext context) {
    return load ? Loading() : Scaffold(
      appBar: AppBar(
        elevation: 0.0,
        title: Text(
            'Login',
        style: TextStyle(
        fontFamily: 'Ubuntu',
        fontWeight: FontWeight.bold,
        ),
      ),
      centerTitle: true,
      backgroundColor: Colors.red[600],
      ),
      backgroundColor: Colors.grey[400],
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Center(
          child: Column(
            children: <Widget>[
              Row(
                children: <Widget>[
                  Expanded(
                    child: Container
                      (child: Text(
                          'Login to edit information, set new password, and more.',
                          style: TextStyle(
                            fontFamily: 'Ubuntu',
                            color: Colors.white,
                          ),
                       ),
                       color: Colors.grey[500],
                       padding: EdgeInsets.fromLTRB(20,20, 37, 20),
                       ),

                  )
                ],
              ),
              Form(
                key: _formKey,
                child: Column(
                  children: <Widget>[
                    SizedBox(height: 20.0,),
                    TextFormField(
                      decoration: InputDecoration(
                        hintText: 'Password',
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.black, width:2.0),
                        ),
                      ),
                      obscureText: true,
                      validator: (val) => val.isEmpty? 'Please enter password':null,
                      onChanged: (val){
                          setState(()=> password=val);
                      },
                    ),
                    SizedBox(height: 20.0,),
                    RaisedButton(
                      color: Colors.red[900],
                      child: Text(
                        'Sign in ',
                        style: TextStyle(
                          color: Colors.white,
                          //backgroundColor: Colors.red[900],
                          fontFamily: 'Ubuntu',
                        ),
                      ),
                      onPressed: ()  async{

                          if(_formKey.currentState.validate()){
                            if(setpassword==password) {
                              setState(()=> load=true);
                              dynamic result = await _auth.signInAnon();
                              if(result==null){
                                setState(() {
                                  err = 'Error signing in on server side';
                                  load = false;
                                });
                              }
                              else{
                                setState(()=> err='Signed in successfully');
                              }
                            }
                            else
                              setState(() => err = 'Incorrect password, please try again.');

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

            ],
          ),
        ),
      ),
    );
  }
}

