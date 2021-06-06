import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/models/user.dart';
import 'package:streetwear_auction_application/services/user/user_service.dart';

import '../rest.dart';

class LoginServiceRest implements LoginService {
  final rest = dependency<RestService>();
  Future<String> checkCredential(String username, String password) async {
    var jsonResult = await rest.get('user/$username/$password');
    return jsonResult['loginStatus'] == 1 ? jsonResult['id'] : '-1';
  }
}
