import 'package:shared_preferences/shared_preferences.dart';

import '../utils/constants.dart';

class Storage {
  late final SharedPreferences _pref;

  Future<Storage> init() async {
    _pref = await SharedPreferences.getInstance();
    return this;
  }

    Future setString(String key, String value) async {
      await _pref.setString(key, value);
    }

    Future setBool(String key, bool value) async {
      await _pref.setBool(key, value);
    }

    bool isLoggedIn() {
      return _pref.getString(AppConstant.userToken) != null ? true : false;
    }

    bool isDeviceFirstTime() {
      return _pref.getBool(AppConstant.deviceFirstTime) ?? false;
    }

}
