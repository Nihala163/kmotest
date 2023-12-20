import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:kmoapplication/home.dart';
import 'package:kmoapplication/log_in.dart';
import 'package:pinput/pinput.dart';

class Otpverify extends StatefulWidget {
  const Otpverify({super.key});

  @override
  State<Otpverify> createState() => _OtpverifyState();
}

class _OtpverifyState extends State<Otpverify> {
  @override
  Widget build(BuildContext context) {

    var smscode="";
    return Scaffold(
body: Column(mainAxisAlignment: MainAxisAlignment.center,
  children: [
    Center(
      child: Pinput(
      
      animationCurve: Curves.bounceIn,
      length: 6,
      onChanged: (value) => smscode=value,
        
      ),
    ),

    ElevatedButton(onPressed: () async {
      FirebaseAuth auth = FirebaseAuth.instance;

 PhoneAuthCredential credential = PhoneAuthProvider.credential(verificationId: Login.verify, smsCode: smscode);

    // Sign the user in (or link) with the credential
    await auth.signInWithCredential(credential);
    Navigator.push(context, MaterialPageRoute(builder: (context) => MyWidget()));

    }, child: Text("veify"))
  ],
)


);

 
  }
}