import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_auth_using_bloc/cubits/auth_cubit/auth_cubit.dart';
import 'package:phone_auth_using_bloc/cubits/auth_cubit/auth_state.dart';
import 'package:phone_auth_using_bloc/screens/verify_phone_no.dart';

class SignInScreen extends StatelessWidget {
  TextEditingController phoneController = TextEditingController();


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
            BlocConsumer<AuthCubit, AuthState>(
              listener: (BuildContext context, state) {
                if(state is AuthCodeSendState){
                  Navigator.push(context, CupertinoPageRoute(
                            builder: (context) => VerifyPhoneNoScreen()));
                }
              },


              builder: (BuildContext context, Object? state) {

                if(state is AuthLoadingState){
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    child: CupertinoButton(
                      onPressed: () {
                        String phoneNo = "+91${phoneController.text}";
                        BlocProvider.of<AuthCubit>(context).sendOTP(phoneNo);

                      },
                      color: Colors.blueAccent,
                      child: const Text("Sign In"),
                    ));
              },

            )
          ],
        ),
      ),
    );
  }
}
