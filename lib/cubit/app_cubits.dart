import 'package:bloc/bloc.dart';
import 'package:sakil/cubit/app_cubit_states.dart';
import 'package:sakil/model/data_model.dart';
import 'package:sakil/services/data_services.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits({required this.data}) : super(InitialState()){
    emit(WelcomeState());
  }
  final DataServices data;
  late final movies;

  void getData()async{
    try{
      emit(LoadingState());
      movies= await data.getInfo();
      emit(LoadedState(movies));

    }catch(e){
      print(e);
      print("FATAL ERROR");
    }
  }


  detailPage(DataModel data){
    emit(DetailState(data));
  }
  
  goHome(){
    emit(LoadedState(movies));
  }
  goInit(){
    emit(WelcomeState());
  }
}