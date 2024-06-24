
import 'package:riverpod_annotation/riverpod_annotation.dart';

import 'register_state.dart';

part 'register_notifier.g.dart';

@riverpod
class RegisterNotifier extends _$RegisterNotifier {
  @override
  RegisterState build() {
    return RegisterState();
  }

  void updateEmail(String email){
    state = state.copyWith(email: email);
  }
  void updatePassword(String password){
    state = state.copyWith(password: password);
  }
}
