import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth_using_bloc/screens/verify_phone_no.dart';

class SignInScreen extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();

  SignInScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Sign In Phone"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller:phoneController,
              maxLength: 10,
              keyboardType:TextInputType.phone,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Phone No.",
                  counterText: ""),
            ),
            const SizedBox(height: 10),
            SizedBox(
              width: MediaQuery.of(context).size.width,
              child: CupertinoButton(
              onPressed: () {
                Navigator.push(context, CupertinoPageRoute(
                    builder: (context) => const VerifyPhoneNoScreen()));
              },
              color: Colors.blueAccent,
                child: const Text("Sign In"),
            ))
          ],
        ),
      ),
    );
  }
}
