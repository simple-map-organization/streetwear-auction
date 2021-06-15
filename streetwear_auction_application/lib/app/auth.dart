import 'dart:async';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:get_it/get_it.dart';

class AuthService implements Disposable {
  final storage = new FlutterSecureStorage();
  final loginStatusController = StreamController<bool>();

  Future<void> triggerLogIn(String jwt) async {
    storage.write(key: 'jwt', value: jwt);
    loginStatusController.add(true);
  }

  Future<void> triggerLogOut() async {
    storage.delete(key: 'jwt');
    loginStatusController.add(false);
  }

  Future<void> updateLoginStatus() async {
    final jwt = await storage.read(key: 'jwt');
    if (jwt != null) {
      triggerLogIn(jwt);
    } else {
      triggerLogOut();
    }
  }

  Stream<bool> isLoggedIn() {
    updateLoginStatus();
    return loginStatusController.stream;
  }

  @override
  FutureOr onDispose() {
    loginStatusController.close();
    throw UnimplementedError();
  }
}
