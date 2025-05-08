class AuthEndpoints {
  static const String _baseUrl = 'http://10.0.2.2:8080';

  // Auth endpoints
  static Uri login = Uri.parse('$_baseUrl/login');
  static Uri register = Uri.parse('$_baseUrl/register');

  // Tambahkan endpoint lain
  static Uri getUserProfile(int userId) => Uri.parse('$_baseUrl/users/$userId');
}
