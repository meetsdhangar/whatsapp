import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:pinput/pinput.dart';

import 'package:velocity_x/velocity_x.dart';
import 'package:whatsapp/controllers/loginController.dart';

class otp extends StatelessWidget {
  const otp({super.key});

  @override
  Widget build(BuildContext context) {
    final logincontroller = Get.find<Logincontroller>();
    String otp = '';
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title:
            "Enter OTP Code".text.size(25).fontWeight(FontWeight.w600).make(),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 300),
              child: Pinput(
                onChanged: (value) {
                  otp = value;
                },
                onCompleted: (value) {
                  otp = value;
                },
                length: 6,
              ),
            ),
            250.heightBox,
            InkWell(
              onTap: () {
                try {
                  logincontroller.verifyotp(otp);
                } catch (e) {
                  if (otp.length < 6) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please Enter 6 Digit OTP")));
                  } else {
                    ScaffoldMessenger.of(context)
                        .showSnackBar(SnackBar(content: Text("Invalid OTP")));
                  }
                }
              },
              child: Center(
                child: Container(
                  child: "Verify".text.white.size(20).makeCentered(),
                  width: 356,
                  height: 53,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25),
                    color: Colors.black,
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    ));
  }
}
