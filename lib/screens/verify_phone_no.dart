import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_auth_using_bloc/cubits/auth_cubit/auth_cubit.dart';
import 'package:phone_auth_using_bloc/cubits/auth_cubit/auth_state.dart';
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
              decoration: const InputDecoration(
                  border: const OutlineInputBorder(),
                  hintText: "Enter Six Digit OTP",
                  counterText: ""),
            ),
            const SizedBox(height: 10),
            BlocConsumer<AuthCubit,AuthState>(
              listener: (BuildContext context, Object? state) {
                if(state is AuthLoggedInState){
                  Navigator.popUntil(context, (route) => route.isFirst);
                  Navigator.pushReplacement(context, CupertinoPageRoute(
                      builder: (context) => const HomeScreen()));
                } else if(state is AuthErrorState){
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(state.error),backgroundColor: Colors.redAccent,duration: Duration(milliseconds: 600),));
                }
              },
              builder: (BuildContext context, state) {
                if(state is AuthLoadingState){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CupertinoButton(
                      onPressed: () {
                        BlocProvider.of<AuthCubit>(context).verifyOTP(otpController.text);
                      },
                      color: Colors.blueAccent,
                      child: const Text("Verify"),));
              },

            )
          ],
        ),
      ),
    );
  }
}
