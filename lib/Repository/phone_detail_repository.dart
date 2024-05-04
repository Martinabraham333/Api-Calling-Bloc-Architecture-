import 'package:api_calling_bloc/Model/phone_detail_model.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class phone_detail_repository {
  Future<List<phone_detail_model>> fetching_phone_details() async {
    print("Inside Repository");
    var url = "https://api.restful-api.dev/objects";
    var response = await http.get(Uri.parse(url));
    print("status code ${response.statusCode}");
    
    if (response.statusCode == 200) {
      var jsonBody = jsonDecode(response.body);
      print("repository one data ${jsonBody[0]['name']}");
      List<phone_detail_model> datas = jsonBody.map<phone_detail_model>((item) => phone_detail_model.fromJson(item)).toList();
      print("Repository data ${datas[0].name}");
      return datas;
    } else {
      print(response.body);
      throw Exception('Failed to fetch phone details');
    }
  }
}
