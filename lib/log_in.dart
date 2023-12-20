import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:kmoapplication/otpverification.dart';

class Login extends StatefulWidget {
   Login({super.key});

  static String verify= "";
  

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {

var userphone="";


Future<void> phoneotp() async {


await FirebaseAuth.instance.verifyPhoneNumber(
  
  phoneNumber: '$userphone',
  verificationCompleted: (PhoneAuthCredential credential) {},
  verificationFailed: (FirebaseAuthException e) {},
  codeSent: (String verificationId, int? resendToken) {
  Login.verify= verificationId;



  },
  codeAutoRetrievalTimeout: (String verificationId) {
    
  },
);



Navigator.push(context, MaterialPageRoute(builder: (context) => Otpverify()));


}





  @override
  Widget build(BuildContext context) {
    return 

    Scaffold(

body: Scaffold(
        appBar: AppBar(
          title: Text('KMO LOGIN PAGE'),
        ),
        body: Column(
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: IntlPhoneField(
                  decoration: InputDecoration(
                    labelText: 'Phone Number',
                    border: OutlineInputBorder(
                      borderSide: BorderSide(),
                    ),
                  ),
                  initialCountryCode: 'US', // Set the initial country code (optional)
                  onChanged: (phone) {
                   userphone=phone.completeNumber; // Callback to get the complete phone number
                  },
                ),
              ),
            ),

ElevatedButton(onPressed: (){phoneotp();}, child: Text("verify phone number"))



          ],
        ),
      ),
    );
  }
}