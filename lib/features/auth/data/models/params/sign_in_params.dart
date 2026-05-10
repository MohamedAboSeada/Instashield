class SignInParams {
  final String email;
  final String password;

  SignInParams({required this.email, required this.password});

  Map<String, Object?> toMap() {
    return <String, Object?>{'email': email, 'password': password};
  }
}
