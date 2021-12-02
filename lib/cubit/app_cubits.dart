import 'package:bloc/bloc.dart';
import 'package:sakil/cubit/app_cubit_states.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits() : super(InitialState()){
    emit(WelcomeState());
  }
}