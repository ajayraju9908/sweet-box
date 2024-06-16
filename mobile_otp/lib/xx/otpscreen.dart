import 'dart:math';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:mobile_otp/xx/home.dart';

class OTPSCreen extends StatefulWidget {
  String verificationid;
  OTPSCreen({super.key, required this.verificationid});

  @override
  State<OTPSCreen> createState() => _OTPSCreenState();
}

class _OTPSCreenState extends State<OTPSCreen> {
  TextEditingController otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("OTP Screen"),
          centerTitle: true,
        ),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(25),
              child: TextField(
                controller: otpController,
                keyboardType: TextInputType.phone,
                decoration: InputDecoration(
                    hintText: "Enter The OTP",
                    suffixIcon: Icon(Icons.phone),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(25),
                    )),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            ElevatedButton(
                onPressed: () async {
                  try {
                    PhoneAuthCredential credential =
                        await PhoneAuthProvider.credential(
                            verificationId: widget.verificationid,
                            smsCode: otpController.text.toString());
                            FirebaseAuth.instance.signInWithCredential(credential).then((value) {
                                 
                                  Navigator.push(context,MaterialPageRoute(builder: (context)=>MyHomePage()));
                            });
                  } catch (ex) {

                        //  log(ex.toString());
                  }
                },
                child: Text("otp"))
          ],
        ));
  }
}
