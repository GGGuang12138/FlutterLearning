import 'package:hello_world2/entity/entitys.dart';
import 'package:hello_world2/utils/http.dart';
//用户
class User{
  /// 登陆方法
  static Future<UserLoginResponseEntity> login({UserLoginRequestEntity params}) async {
    var response = await HttpUtil().post('/user/login',params:params);
    return UserLoginResponseEntity.fromJson(response);
  }
}