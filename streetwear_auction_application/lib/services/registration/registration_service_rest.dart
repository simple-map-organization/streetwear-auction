import 'package:streetwear_auction_application/app/dependencies.dart';
import 'package:streetwear_auction_application/services/registration/registration_service.dart';

import '../rest.dart';

class RegistrationServiceRest implements RegistrationService {
  final rest = dependency<RestService>();

  Future<String> checkUsername(String username, String email) async {
    final result = await rest.get('registration?' +
        Uri(queryParameters: {"username": username, "email": email}).query);
    return result;
  }

  Future<int> register(
      String username, String password, String email, String phoneNo) async {
    final result = await rest.post('registration', data: {
      'username': username,
      'password': password,
      'email': email,
      'phoneNo': phoneNo
    });
    return result['isRegistered'];
  }
}
