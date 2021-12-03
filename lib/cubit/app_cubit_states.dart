

import 'package:equatable/equatable.dart';
import 'package:sakil/model/data_model.dart';

abstract class CubitStates extends Equatable{}


class InitialState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class WelcomeState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class LoadingState extends CubitStates{
  @override
  // TODO: implement props
  List<Object> get props => [];

}

class LoadedState extends CubitStates{
  LoadedState(this.movies,this.moviessem,this.moviestime);
  final List<DataModel> movies;
  final List<DataModel> moviessem;
  final List<DataModel> moviestime;
  @override
  // TODO: implement props
  List<Object> get props => [movies];

}
class DetailState extends CubitStates{
  DetailState(this.movies);
  final DataModel movies;
  @override
  // TODO: implement props
  List<Object> get props => [movies];

}