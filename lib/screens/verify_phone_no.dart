import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:phone_auth_using_bloc/screens/home_screen.dart';

class VerifyPhoneNoScreen extends StatelessWidget {
  TextEditingController otpController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Verify Phone No"),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            TextField(
              controller:otpController,
              maxLength: 10,
              keyboardType:TextInputType.phone,
              decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: "Enter Six Digit OTP",
                  counterText: ""),
            ),
            const SizedBox(height: 10),
            SizedBox(
                width: MediaQuery.of(context).size.width,
                child: CupertinoButton(
                  onPressed: () {
                    Navigator.push(context, CupertinoPageRoute(
                        builder: (context) => const HomeScreen()));
                  },
                  color: Colors.blueAccent,
                  child: const Text("Verify"),
                ))
          ],
        ),
      ),
    );
  }
}
