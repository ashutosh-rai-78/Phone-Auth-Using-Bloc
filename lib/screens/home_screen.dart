import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_auth_using_bloc/cubits/auth_cubit/auth_cubit.dart';
import 'package:phone_auth_using_bloc/cubits/auth_cubit/auth_state.dart';
import 'package:phone_auth_using_bloc/screens/sign_in_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home Page"),
        centerTitle: true,
      ),
      body: Container(
        child: Center(
          child: BlocConsumer<AuthCubit, AuthState>(
            listener: (BuildContext context, Object? state) {
              if(state is AuthLoggedOutState){
                Navigator.popUntil(context, (route) => route.isFirst);
                Navigator.pushReplacement(context, CupertinoPageRoute(
                    builder: (context) => SignInScreen()));
              }
            },
            builder: (BuildContext context, state) {
              return CupertinoButton(onPressed: () {
                BlocProvider.of<AuthCubit>(context).logOut();

              }, child: Text("Log Out"),);
            },

            ),
          ),
        ),

    );
  }
}

