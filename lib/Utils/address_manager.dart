import 'package:shared_preferences/shared_preferences.dart';

class AddressManager {
  static const List<String> addressType = [',', 'Home', 'Office', 'Other'];
  setAddress(int type) async {
    final pref = await SharedPreferences.getInstance();
    pref.setInt('AddressType', type);
  }

  Future<int?> getAddress() async {
    final pref = await SharedPreferences.getInstance();
    return pref.getInt('AddressType');
  }
}
