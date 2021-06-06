import 'package:streetwear_auction_application/app/dependencies.dart';

import '../rest.dart';
import 'login_service.dart';

class LoginServiceRest implements LoginService {
  final rest = dependency<RestService>();
  Future<String> checkCredential(String username, String password) async {
    var jsonResult = await rest.get('login/$username/$password');
    return jsonResult['loginStatus'] == 1 ? jsonResult['id'] : '-1';
  }
}
