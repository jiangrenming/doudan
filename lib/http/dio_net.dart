import 'dart:io';

import 'package:dio/dio.dart';
import 'package:doudan/http/api_service.dart';
import 'package:doudan/constants/constant.dart';
import 'package:doudan/http/api_callback.dart';

//dio框架的封装

class DioApi{


  static ApiService apiService;
  static DioApi instance;
  String url = Constant.BASE_URL1;

  DioApi(){
   var options =  BaseOptions(
      connectTimeout: 5000,
      receiveTimeout: 3000,
      contentType: ContentType("application","json",charset: "utf-8"),
      baseUrl: url,);
    Dio dio = new Dio(options);
   dio.interceptors.add(ResponseWrapper());  //添加header头部
   dio.interceptors.add(LogInterceptor(request: true,responseBody: true)); //日志打印拦截器
   apiService = ApiService(dio: dio);
  }

  static ApiService getInstance(){
    if(instance == null){
      instance = DioApi();
    }
    return _getService();
  }

  static ApiService _getService(){
    return apiService;
  }
}

