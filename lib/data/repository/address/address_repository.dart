import 'package:furniture_app/data/models/address_model.dart';
import 'package:furniture_app/data/repository/address/i_address_repository.dart';


class AddressRepository implements IAddressRepository {
  List<AddressModel> addressList = [];

  addAddress(AddressModel? address) {
    AddressModel? addressModel = addressList
        .firstWhere((element) => element.id == address!.id, 
      
    );
    if (addressModel != null) {
      int index = addressList.indexOf(addressModel);
      addressList.removeAt(index);
      addressList.insert(index, address!);
    }
  }

  removeAddress(AddressModel? address) {
    addressList.removeAt(addressList.indexOf(address!));
  }
}
