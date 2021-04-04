import 'package:flutter/material.dart';
import 'package:furniture_app/utils/buttons.dart';
import 'package:furniture_app/utils/text_field.dart';
import 'package:page_transition/page_transition.dart';

import 'package:furniture_app/data/models/address_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'choose_address.dart';

// ignore: must_be_immutable
class AddAddress extends StatefulWidget {
  final bool isEdit;
  final AddressModel addressModel;

  AddAddress({
    Key? key,
    required this.isEdit,
    required this.addressModel,
  }) : super(key: key);
  @override
  _AddAddressState createState() => _AddAddressState();
}

class _AddAddressState extends State<AddAddress> {
  TextEditingController apartmentController = TextEditingController();
  TextEditingController areaController = TextEditingController();
  TextEditingController landmarkController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController pinCodeController = TextEditingController();
  TextEditingController mobileNumberController = TextEditingController();
  bool isLoading = false;
  AddressModel addressModel = AddressModel();
  bool canPress = false;

  _editAddress() async {
    AddressModel address = AddressModel(
      id: addressModel.id,
      city: cityController.text,
      deliveryAddress: apartmentController.text,
      pinCode: addressModel.pinCode,
      landMark: landmarkController.text,
      deliveryArea: addressModel.deliveryArea,
      mobileNumber: mobileNumberController.text,
      userName: nameController.text,
    );
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<AddressModel> addressList = [];
    List<String>? getStoredList = prefs.getStringList('AddressList');
    if (getStoredList != null) {
      getStoredList.forEach((element) {
        addressList.add(AddressModel.fromJson(element));
      });
    }
    AddressModel model = addressList
        .firstWhere((element) => element.id == addressModel.id, orElse: () {
      return AddressModel();
    });
    int index = addressList.indexOf(model);
    addressList.removeAt(index);
    addressList.insert(index, address);
    List<String>? setStringList = [];
    addressList.forEach((element) {
      setStringList.add(element.toJson());
    });
    prefs.setStringList('AddressList', setStringList);
    Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeftWithFade,
          child: ChooseAddress(),
        ));
  }

  Future<int> generatedAddressId() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    int? storedId = prefs.getInt('productId');

    if (storedId != null) {
      int idToPrefs = storedId + 1;
      //prefs.remove('productId');

      prefs.setInt('productId', idToPrefs);
      return idToPrefs;
    } else {
      prefs.setInt('productId', 1);
      return 1;
    }
  }

  _storeAddress() async {
    AddressModel address = AddressModel(
      id: await generatedAddressId(),
      city: cityController.text,
      deliveryAddress: apartmentController.text,
      pinCode: pinCodeController.text,
      landMark: landmarkController.text,
      deliveryArea: areaController.text,
      userName: nameController.text,
      mobileNumber: mobileNumberController.text,
    );

    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<AddressModel> addressList = [];
    List<String>? getStoredList = prefs.getStringList('AddressList') ?? [];
    if (getStoredList.isNotEmpty) {
      getStoredList.forEach((element) {
        addressList.add(AddressModel.fromJson(element));
      });
    }

    addressList.add(address);
    print('this is address list $addressList');

    List<String>? setStringList = [];
    addressList.forEach((element) {
      setStringList.add(element.toJson());
    });
    prefs.setStringList('AddressList', setStringList);

    Navigator.pushReplacement(
        context,
        PageTransition(
          type: PageTransitionType.rightToLeftWithFade,
          child: ChooseAddress(),
        ));
  }

  validateEntries() {
    var canHit = apartmentController.text.isNotEmpty &&
        pinCodeController.text.isNotEmpty &&
        landmarkController.text.isNotEmpty &&
        cityController.text.isNotEmpty &&
        nameController.text.isNotEmpty &&
        areaController.text.isNotEmpty &&
        mobileNumberController.text.isNotEmpty;

    if (canHit) {
      setState(() {
        canPress = true;
      });
    } else {
      setState(() {
        canPress = false;
      });
    }
  }

  @override
  void initState() {
    super.initState();
    apartmentController.addListener(() {
      validateEntries();
    });
    areaController.addListener(() {
      validateEntries();
    });
    landmarkController.addListener(() {
      validateEntries();
    });
    nameController.addListener(() {
      validateEntries();
    });

    if (widget.isEdit) {
      setState(() {
        addressModel = widget.addressModel;
        cityController.text = widget.addressModel.city!;
        apartmentController.text = widget.addressModel.deliveryAddress!;
        areaController.text = widget.addressModel.deliveryArea!;
        landmarkController.text = widget.addressModel.landMark!;
        nameController.text = widget.addressModel.userName!;
        mobileNumberController.text = widget.addressModel.mobileNumber!;
        pinCodeController.text = widget.addressModel.pinCode!;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Add Address')),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
                padding: const EdgeInsets.only(
                    top: 20, bottom: 5, right: 24, left: 24),
                child: Text('Address'.toUpperCase(),
                    style:
                        TextStyle(fontSize: 19, fontWeight: FontWeight.w500))),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: TextInputField(
                controller: cityController,
                hintText: 'City',
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24),
              child: TextInputField(
                controller: pinCodeController,
                hintText: 'Pincode',
                keyboard: TextInputType.number,
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
              child: Text('Other Details'.toUpperCase(),
                  style: TextStyle(fontSize: 19, fontWeight: FontWeight.w500)),
            ),
            TextInputField(
              controller: nameController,
              hintText: 'Name',
            ),
            TextInputField(
              controller: mobileNumberController,
              keyboard: TextInputType.number,
              hintText: 'Mobile',
            ),
            TextInputField(
              controller: apartmentController,
              hintText: 'Flat/Apartment no.',
            ),
            TextInputField(
              controller: areaController,
              hintText: 'Area Name',
            ),
            TextInputField(
              controller: landmarkController,
              hintText: 'Landmark ',
            ),
            Padding(
              padding: const EdgeInsets.only(
                  top: 20.0, left: 15, right: 15, bottom: 20),
              child: Container(
                  height: 50,
                  width: double.infinity,
                  child: MaterialButton(
                    disabledTextColor: Colors.grey,
                    disabledColor:
                        Theme.of(context).primaryColor.withOpacity(0.5),
                    color: Theme.of(context).primaryColor,
                    elevation: 4,
                    hoverElevation: 20,
                    shape: new RoundedRectangleBorder(
                        borderRadius: new BorderRadius.circular(20.0)),
                    onPressed: (canPress)
                        ? () async {
                            (widget.isEdit)
                                ? await _editAddress()
                                : await _storeAddress();

                            setState(() {
                              isLoading = true;
                            }); //login butoon function
                          }
                        : null,
                    child: Padding(
                      padding: const EdgeInsets.all(5.0),
                      child: Text(
                        (widget.isEdit)
                            ? 'Save Address'.toUpperCase()
                            : 'Add Address'.toUpperCase(),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
