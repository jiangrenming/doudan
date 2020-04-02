

import 'package:doudan/entity_factory.dart';

class HttpResponseEntity<T>{

  T data;
  String message;
  String resultCode;
  HttpResponseEntity({this.data, this.message, this.resultCode});


  HttpResponseEntity.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? EntityFactory.generateOBJ<T>(json['data']) : null;
    resultCode = json['resultCode'];
    message = json['message'];
  }



}

