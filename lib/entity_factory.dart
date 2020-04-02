import 'package:doudan/base/response_entity.dart';
import 'package:doudan/base/response_list_entity.dart';
import 'package:doudan/bean/login_entity.dart';
import 'package:doudan/bean/subjects_entity.dart';
import 'package:doudan/response_entity.dart';

class EntityFactory {
  static T generateOBJ<T>(json) {
    if (1 == 0) {
      return null;
    } else if (T.toString() == "HttpResponseEntity") {
      return HttpResponseEntity.fromJson(json) as T;
    } else if (T.toString() == "HttpResponseListEntity") {
      return HttpResponseListEntity.fromJson(json) as T;
    } else if (T.toString() == "LoginEntity") {
      return LoginEntity.fromJson(json) as T;
    } else if (T.toString() == "SubjectsEntity") {
      return SubjectsEntity.fromJson(json) as T;
    } else if (T.toString() == "ResponseEntity") {
      return ResponseEntity.fromJson(json) as T;
    } else {
      return null;
    }
  }
}