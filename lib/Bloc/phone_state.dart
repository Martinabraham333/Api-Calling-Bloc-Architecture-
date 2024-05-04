import 'package:api_calling_bloc/Model/phone_detail_model.dart';

abstract class phone_state {}

class inital_phone_state extends phone_state {}

class success_phone_state extends phone_state {
  
  final List<phone_detail_model> phone_details;

  success_phone_state({required this.phone_details});
}

class failure_phone_state extends phone_state {
  final String error;
  failure_phone_state(this.error);
}

class loading_phone_state extends phone_state {}
