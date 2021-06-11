abstract class RegistrationService {
  Future<int> register(
      String username, String password, String email, String phoneNo);
  Future<String> checkUsername(String username, String email);
}
