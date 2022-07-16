import 'package:breaking_bad/cubit/cubit.dart';
import 'package:breaking_bad/screens/home_screen.dart';
import 'package:breaking_bad/shared/network/dio_helper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  DioHelper.init();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit()..getAllCharacters(),
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(


        ),
        home: const HomeScreen(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

