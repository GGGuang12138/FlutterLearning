import 'package:hello_world2/entity/entitys.dart';
import 'package:hello_world2/utils/http.dart';

class PatientAPI {
  /// 病人列表
  static Future<List<PatientPagesListResponseEntity>> list() async {
    var response = await HttpUtil().get('/patient/list');
    return response
        .map<PatientPagesListResponseEntity>(
            (item) => PatientPagesListResponseEntity.fromJson(item))
        .toList();
  }
}