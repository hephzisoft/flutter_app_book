class RegisterState {
  String email;
  String password;

  RegisterState({this.email = '', this.password = ''});

  RegisterState copyWith({String? email, String? password}) {
    print(email);
    return RegisterState(
      email: email ?? this.email,
      password: password ?? this.password,
    );
  }
}
