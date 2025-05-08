import '../../services/auth_service.dart';

class RegisterLogic {
  static Future<void> submit({
    required String username,
    required String email,
    required String password,
}) async {
    await AuthService.registerUser(
      username: username,
      email: email,
      password: password,
    );
  }
}