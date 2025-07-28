abstract class Mystate {}

class InitialState extends Mystate {}

class LoadingState extends Mystate {}

class LoadedState extends Mystate {
  List data;
  LoadedState({required this.data});
}

class ErrorState extends Mystate {
  String error;
  ErrorState({required this.error});
}
