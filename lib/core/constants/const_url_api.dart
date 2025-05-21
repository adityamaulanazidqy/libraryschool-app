class AuthEndpoints {
  // static const String _baseUrl = 'http://192.168.1.10:8080';
  static const String _baseUrl = 'http://10.0.2.2:8080';

  static Uri login = Uri.parse('$_baseUrl/login');
  static Uri register = Uri.parse('$_baseUrl/register');

  static Uri getUserProfile(int userId) => Uri.parse('$_baseUrl/users/$userId');
}
