import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:http/http.dart' as http;

import 'cubit_state.dart';

class CubitApiExample extends Cubit<Mystate> {
  CubitApiExample() : super(InitialState());

  getData() async {
    try {
      emit(LoadingState());

      var response = await http.get(
        Uri.parse("https://dummyjson.com/products"),
      );

      var result = jsonDecode(response.body);

      print(result['products']);

      emit(LoadedState(data: result['products']));
    } catch (e) {
      emit(ErrorState(error: e.toString()));
    }
  }
}
