//import 'package:first_test/accept_changes.dart';
import 'package:first_test/auth.dart';
import 'package:first_test/authenticate.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:first_test/user.dart';
import 'package:first_test/wrapper.dart';


class EditInfo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value: AuthService().user,
      child: Wrapper(),
    );
  }
}

