import 'package:api_calling_bloc/Bloc/phone_event.dart';
import 'package:api_calling_bloc/Bloc/phone_state.dart';
import 'package:api_calling_bloc/Model/phone_detail_model.dart';
import 'package:api_calling_bloc/Repository/phone_detail_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class phone_bloc extends Bloc<phone_event, phone_state> {
  final phone_detail_repository phone_repository;
  phone_bloc(this.phone_repository) : super(inital_phone_state()) {
    on<fetching_phone_event>(_fetching_phone_details);
  }

  _fetching_phone_details(
      fetching_phone_event event, Emitter<phone_state> emit) async {
    emit(loading_phone_state());
    try {
      print("Entered into bloc fetching");
      final List<phone_detail_model> phone_details = await phone_repository.fetching_phone_details();
      print("inside try :  $phone_details");
      return emit(success_phone_state(phone_details: phone_details));
    } catch (e) {
      print("Error white fetching phone details : Bloc Page.  $e");
      return emit(failure_phone_state(e.toString()));
    }
  }
}
