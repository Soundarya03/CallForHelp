import 'package:first_test/accept_changes.dart';
import 'package:first_test/auth.dart';
import 'package:first_test/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_test/user.dart';

class Wrapper extends StatelessWidget {
  @override
  Widget build(BuildContext context) {

    final user = Provider.of<User>(context);



    //return either authenticate or accept_changes
    if (user==null) {
      return Authenticate();
    }
    else {
      return AcceptChanges();
    }
  }
}
