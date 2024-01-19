import 'dart:async';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:whatsapp/controllers/loginController.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final logincontroller = Get.put(Logincontroller());
    Timer(Duration(seconds: 3), () {
      logincontroller.checkuserlogin();
    });
    return Scaffold(
        body: Center(
      child: Image.asset('assets/images/logo.png'),
    ));
  }
}
