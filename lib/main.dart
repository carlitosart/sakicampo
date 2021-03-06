import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakil/cubit/app_cubit_logics.dart';
import 'package:sakil/cubit/app_cubits.dart';
import 'package:sakil/pages/detail_page.dart';
import 'package:sakil/pages/navpages/main_page.dart';
import 'package:sakil/pages/singin_up/login_page.dart';
import 'package:sakil/pages/welcome_page.dart';
import 'package:sakil/services/data_services.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.red,
      ),
      home: //LoginPage()
      BlocProvider<AppCubits>(
        create: (context) => AppCubits(
          data: DataServices(),
        ),
        child: AppCubitLogics(),
      )
    );
  }
}