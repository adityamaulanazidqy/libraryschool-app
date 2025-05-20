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

class PasswordValidation {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Password tidak boleh kosong';
    }
    if (value.length < 8) {
      return 'Password minimal 8 karakter';
    }
    return null;
  }
}

class EmailValidation {
  static String? validate(String? value) {
    if (value == null || value.isEmpty) {
      return 'Email tidak boleh kosong';
    }
    if (!value.contains('@')) {
      return 'Format email tidak valid';
    }
    return null;
  }
}
