import 'package:news_app/layout/cubit/cubit.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CashHelper {
  static SharedPreferences sharedPreferences;
  static init() async {
    sharedPreferences = await SharedPreferences.getInstance();
  }

  static Future putData(bool v) async {
    return await SharedPreferences.getInstance().then((value) {
      value.setBool('isDark', v);
    });
  }

  static bool getData() {
    return sharedPreferences.getBool('isDark');
  }
}
