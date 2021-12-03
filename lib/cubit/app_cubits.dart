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
  late final moviessem;
  late final moviestime;

  void getData()async{
    try{
      emit(LoadingState());
      movies= await data.getInfo();
      print("datat");
      moviessem= await data.getSem();
      moviestime= await data.getTime();
      emit(LoadedState(movies,moviessem,moviestime));

    }catch(e){
      print(e);
      print("FATAL ERROR");
    }
  }


  detailPage(DataModel data){
    emit(DetailState(data));
  }
  
  goHome(){
    emit(LoadedState(movies,moviessem,moviestime));
  }
  goInit(){
    emit(WelcomeState());
  }
}