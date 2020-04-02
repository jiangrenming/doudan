
import 'package:dio/dio.dart';
import 'package:doudan/utils/share_utils.dart';
import 'package:doudan/constants/constant.dart';

class ResponseWrapper extends InterceptorsWrapper{

  @override
  onRequest(RequestOptions options) {

    //TodO()请求头部预处理
    Map<String, String> headers = new Map();
   // headers["Accept-Charset"] = "utf-8";
  //  headers["Connection"] = "keep-alive";
 //   headers["Accept"] = "*/*";
 //   headers["version"] = "1.0";
    headers["clientType"] = "Android";
    Future<String> future = SharedPreferencesDataUtils.getInstance().getString(Constant.TOKEN);
    if(future != null){
      headers["Authorization"] = future.toString();
    }
    headers["Authorization"] = "";
    options.headers = headers;
    return options;
  }


}