
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'login_state.dart';

part 'login_notifier.g.dart';

@riverpod
class LoginNotifier extends _$LoginNotifier {
  @override
  LoginState build() {
    return LoginState();
  }

  void updateEmail(String email){
    state = state.copyWith(email: email);
  }
  void updatePassword(String password){
    state = state.copyWith(password: password);
  }
}
