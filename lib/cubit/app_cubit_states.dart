

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
  LoadedState(this.movies);
  final List<DataModel> movies;
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