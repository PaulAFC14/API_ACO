import 'package:aco/src/screens/forget_pass.dart';
import 'package:aco/src/splash/splash.dart';
import 'package:flutter/material.dart';

import '../../screens/login.dart';

class Routes{
  late BuildContext context;

  Routes(this.context);

  goToLogin() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => const LoginScreen())));
  }

  goToForgotPass() {
    Navigator.of(context).pushReplacement(
        MaterialPageRoute(builder: ((context) => const ForgetPassScreen())));
  }

  
}