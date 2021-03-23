import 'package:flutter/cupertino.dart';
import 'package:furniture_app/data/models/address_model.dart';

class AddressProvider extends ChangeNotifier {
  List<AddressModel> addressList = [];

  addAddress(AddressModel address) {
    AddressModel addressModel = addressList
        .firstWhere((element) => element.id == address.id, orElse: () {
      addressList.add(address);
    } as AddressModel Function()?);
    if (addressModel != null) {
      int index = addressList.indexOf(addressModel);
      addressList.removeAt(index);
      addressList.insert(index, address);
    }
    notifyListeners();
  }

  removeAddress(AddressModel address) {
    addressList.removeAt(addressList.indexOf(address));
    notifyListeners();
  }
}
