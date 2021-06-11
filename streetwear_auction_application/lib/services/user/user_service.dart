import 'package:streetwear_auction_application/models/user.dart';

abstract class UserService {
  Future<User> getUser(String id);
  Future<User> updateUser(String id, User user);
}
