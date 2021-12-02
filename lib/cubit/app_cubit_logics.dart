import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sakil/cubit/app_cubit_states.dart';
import 'package:sakil/cubit/app_cubits.dart';
import 'package:sakil/pages/detail_page.dart';
import 'package:sakil/pages/home_page.dart';
import 'package:sakil/pages/welcome_page.dart';

class AppCubitLogics extends StatefulWidget {
  const AppCubitLogics({Key? key}) : super(key: key);

  @override
  _AppCubitLogicsState createState() => _AppCubitLogicsState();
}

class _AppCubitLogicsState extends State<AppCubitLogics> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocBuilder<AppCubits,CubitStates>(
        builder: (context,state){
          if(state is DetailState){
            return DetailPage();
          }if(state is WelcomeState){
            return WelcomePage();
          }if(state is LoadedState){
            return HomePage();
          }if(state is LoadingState){
            return Center(child: CircularProgressIndicator(),);
          }else{
            return Container();
          }
        },
      ),
    );
  }
}
