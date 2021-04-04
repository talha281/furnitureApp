import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:furniture_app/data/models/address_model.dart';
import 'package:furniture_app/global/widgets/circular_progress_indicator.dart';
import 'package:furniture_app/ui/Address/add_Address.dart';
import 'package:furniture_app/ui/dashboard/dashboard.dart';
import 'package:furniture_app/utils/address_manager.dart';
import 'package:page_transition/page_transition.dart';
import 'package:shared_preferences/shared_preferences.dart';

// ignore: must_be_immutable
class ChooseAddress extends StatefulWidget {
  const ChooseAddress();

  @override
  _ChooseAddressState createState() => _ChooseAddressState();
}

class _ChooseAddressState extends State<ChooseAddress> {
  GlobalKey<ScaffoldState> _chooseAddressKey = GlobalKey<ScaffoldState>();
  List<AddressModel> addresses = [];
  bool isLoading = false;
  bool isEdit = false;

  _getAddresses() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<AddressModel> addressList = [];
    List<String>? getStoredList = prefs.getStringList('AddressList');
    if (getStoredList != null) {
      getStoredList.forEach((element) {
        addressList.add(AddressModel.fromJson(element));
      });
    }
    print('this is $getStoredList');
    setState(() {
      addresses = addressList;
    });
  }

  _delAddress(int id) async {
    print('inside the delete address');
    SharedPreferences prefs = await SharedPreferences.getInstance();
    List<AddressModel> addressList = [];
    List<String>? getStoredList = prefs.getStringList('AddressList');
    if (getStoredList != null) {
      getStoredList.forEach((element) {
        addressList.add(AddressModel.fromJson(element));
      });
    }
    AddressModel addressModel =
        addressList.firstWhere((element) => element.id == id, orElse: () {
      return AddressModel();
    });
    int index = addressList.indexOf(addressModel);
    addressList.removeAt(index);
    print(addressList);
    List<String>? setStringList = [];
    addressList.forEach((element) {
      setStringList.add(element.toJson());
    });
    print(setStringList);

    prefs.setStringList('AddressList', setStringList);
    setState(() {
      addresses = addressList;
    });
  }

  _saveCurrentAddress(int index) async {
    final prefs = await SharedPreferences.getInstance();
    var currentAddress = json.encode(addresses[index].toJson());
    prefs.setString("currentAddress", currentAddress);
  }

  @override
  void initState() {
    _getAddresses();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        key: _chooseAddressKey,
        appBar: AppBar(
          title: Text('Choose Address'),
        ),
        body: (isLoading)
            ? Circular(
                color: Theme.of(context).primaryColor,
              )
            : (addresses.length != 0 || addresses.length > 0)
                ? SingleChildScrollView(
                    child: Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.only(top: 20, bottom: 10),
                          child: Text('Tap on address to select',
                              style: TextStyle(
                                fontWeight: FontWeight.normal,
                                fontSize: 18,
                              )),
                        ),
                        ListView.builder(
                            itemCount: addresses.length,
                            physics: ClampingScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) {
                              return Padding(
                                padding: const EdgeInsets.only(
                                    left: 12, right: 12, top: 8, bottom: 3),
                                child: Container(
                                  width: double.maxFinite,
                                  //height: 70,
                                  padding: EdgeInsets.only(
                                      left: 1, top: 4, right: 1),
                                  decoration: BoxDecoration(
                                      border:
                                          Border.all(color: Color(0xFFFCBF1E)),
                                      borderRadius: BorderRadius.circular(10)),
                                  child: Material(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(5.5)),
                                    elevation: 2,
                                    clipBehavior: Clip.antiAliasWithSaveLayer,
                                    child: ListTile(
                                      onTap: () async {
                                        _saveCurrentAddress(index);
                                        int? selectedAddress =
                                            await AddressManager().getAddress();
                                        selectedAddress == 0
                                            ? Navigator.pushReplacement(
                                                context,
                                                PageTransition(
                                                    child: Dashboard(),
                                                    type: PageTransitionType
                                                        .rightToLeftWithFade))
                                            : Navigator.of(context).pop();
                                      },
                                      isThreeLine: true,
                                      title: Text(
                                          '${addresses[index].userName}|${addresses[index].mobileNumber}',
                                          style: TextStyle(
                                              fontFamily: 'Ubuntu',
                                              fontSize: 18,
                                              fontWeight: FontWeight.normal,
                                              color: Theme.of(context)
                                                  .primaryColor)),
                                      subtitle: Text(
                                          "${addresses[index].deliveryAddress}\t${addresses[index].deliveryArea}\t${addresses[index].landMark}\t${addresses[index].city}\t${addresses[index].pinCode}",
                                          style: TextStyle(
                                              fontFamily: 'Ubuntu',
                                              fontSize: 14,
                                              fontWeight: FontWeight.normal)),
                                      trailing: Container(
                                        width: size.width / 3.4,
                                        child: Row(
                                          children: [
                                            Padding(
                                              padding:
                                                  const EdgeInsets.only(top: 6),
                                              child: IconButton(
                                                icon: Icon(
                                                  FontAwesomeIcons.pen,
                                                  color: Theme.of(context)
                                                      .primaryColor,
                                                  size: 20,
                                                ),
                                                onPressed: () {
                                                  setState(() {
                                                    isEdit = !isEdit;
                                                  });
                                                  print(
                                                      addresses[index].pinCode);
                                                  Navigator.push(
                                                    context,
                                                    PageTransition(
                                                      child: AddAddress(
                                                        isEdit: true,
                                                        addressModel:
                                                            addresses[index],
                                                      ),
                                                      type: PageTransitionType
                                                          .rightToLeftWithFade,
                                                    ),
                                                  );
                                                },
                                              ),
                                            ),
                                            Padding(
                                              padding: const EdgeInsets.only(
                                                  top: 10.6, right: 6),
                                              child: IconButton(
                                                icon: Icon(
                                                  FontAwesomeIcons.trash,
                                                  color: Colors.red,
                                                  size: 20,
                                                ),
                                                onPressed: () async {
                                                  showDialog(
                                                      context: context,
                                                      builder:
                                                          (context) =>
                                                              AlertDialog(
                                                                shape: RoundedRectangleBorder(
                                                                    borderRadius:
                                                                        BorderRadius.circular(
                                                                            20)),
                                                                title: Text(
                                                                  'Are you sure?',
                                                                  style: TextStyle(
                                                                      color: Theme.of(
                                                                              context)
                                                                          .primaryColor,
                                                                      fontSize:
                                                                          18,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .w500),
                                                                ),
                                                                content: Text(
                                                                  'You are about to delete this address.',
                                                                  style: TextStyle(
                                                                      color: Theme.of(
                                                                              context)
                                                                          .primaryColor
                                                                          .withOpacity(
                                                                              0.7),
                                                                      fontSize:
                                                                          16,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal),
                                                                ),
                                                                actions: [
                                                                  TextButton(
                                                                      onPressed:
                                                                          () async {
                                                                        await _delAddress(
                                                                            addresses[index].id!);
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child:
                                                                          Text(
                                                                        'Yes',
                                                                        style: TextStyle(
                                                                            color:
                                                                                Color(0xFFFCBF1E)),
                                                                      )),
                                                                  TextButton(
                                                                      onPressed:
                                                                          () {
                                                                        Navigator.pop(
                                                                            context);
                                                                      },
                                                                      child: Text(
                                                                          'No',
                                                                          style:
                                                                              TextStyle(color: Color(0xFFFCBF1E))))
                                                                ],
                                                                //  }, child: null,)]
                                                              ));
                                                },
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              );
                            }),
                      ],
                    ),
                  )
                : Center(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      child: Text(
                        'No address available click on the add icon to add address.',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.w400,
                            color: Theme.of(context)
                                .primaryColor
                                .withOpacity(0.7)),
                      ),
                    ),
                  ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            FontAwesomeIcons.plus,
            color: Colors.white,
          ),
          backgroundColor: Color(0xFFFCBF1E).withOpacity(0.8),
          onPressed: () => Navigator.pushReplacement(
            context,
            PageTransition(
              child: AddAddress(
                isEdit: false,
                addressModel: AddressModel(),
              ),
              type: PageTransitionType.rightToLeftWithFade,
            ),
          ),
        ));
  }
}
