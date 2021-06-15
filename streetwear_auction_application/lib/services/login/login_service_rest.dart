import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import '../../app/dependencies.dart';
import '../rest.dart';
import 'login_service.dart';

class LoginServiceRest implements LoginService {
  final storage = new FlutterSecureStorage();
  final rest = dependency<RestService>();

  Future<String> checkCredential(String username, String password) async {
    var jsonResult = await rest
        .post('login', data: {'username': username, 'password': password});
    return jsonResult['loginStatus'] == 1 ? jsonResult['jwt'] : '-1';
  }
}
