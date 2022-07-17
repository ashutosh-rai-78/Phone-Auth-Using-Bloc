import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:phone_auth_using_bloc/cubits/auth_cubit/auth_cubit.dart';
import 'package:phone_auth_using_bloc/cubits/auth_cubit/auth_state.dart';
import 'package:phone_auth_using_bloc/screens/home_screen.dart';
import 'package:phone_auth_using_bloc/screens/sign_in_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => AuthCubit(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: BlocBuilder<AuthCubit, AuthState>(
          buildWhen: (oldState, newState){
            return oldState is AuthInitialState;
          },
          builder: (BuildContext context, state) {
            if (state is AuthLoggedInState) {
              return HomeScreen();
            } else if (state is AuthLoggedOutState) {
              return SignInScreen();
            } else {
              return Scaffold();
              //Add Splash Screen
            }
          },
        ),
      ),
    );
  }
}
