import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'tab_controller.g.dart';

@riverpod
class TabController extends _$TabController {
  @override
  int build() => 0;

  void changeIndex(int value) {
    state = value;
  }
}
