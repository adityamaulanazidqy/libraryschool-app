bool isValidPassword(String password) {
  final passwordRegex = RegExp(r'^(?=.*[a-z]).{6,}$');
  return passwordRegex.hasMatch(password);
}
