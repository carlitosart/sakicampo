import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:sakil/model/data_model.dart';

class DataServicesSemana{
  String baseUrl = "http://192.168.100.15:8083";
  Future<List<DataModel>> getInfo() async{
    var apiUrl = '/film?country_id=8&page=1';
    http.Response res = await http.get(Uri.parse(baseUrl+apiUrl));
    try{
      if(res.statusCode==200){
        List<dynamic> list = json.decode(res.body);
        print(list);
        return list.map((e) => DataModel.fromJson(e)).toList();
      }
      return <DataModel>[];
    }catch(e){
      print("ASDASD");
      return <DataModel>[];
    }
  }
}