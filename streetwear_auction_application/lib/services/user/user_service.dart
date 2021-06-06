import 'package:streetwear_auction_application/models/user.dart';

abstract class LoginService {
  Future<String> checkCredential(String username, String password);
}
