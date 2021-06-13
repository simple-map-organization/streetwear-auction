import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/models/user.dart';

import '../rest.dart';
import 'user_service.dart';

class UserServiceRest implements UserService {
  final rest = dependency<RestService>();
  Future<User> getUser() async {
    var jsonResult = await rest.get('user');
    return User.fromJson(jsonResult);
  }

  Future<User> updateUser(User user) async {
    var jsonResult = await rest.put('user', data: user.toJson());
    return User.fromJson(jsonResult);
  }
}
