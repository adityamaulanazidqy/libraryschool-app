import '../../services/auth_service.dart';

class LoginLogic {
  static Future<bool> submit({
    required String email,
    required String password,
  }) async {
    var status = await AuthService.loginUser(
      email: email,
      password: password,
    );

    return status;
  }
}