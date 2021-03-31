import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:furniture_app/Utils/navigator_class.dart';
import 'package:furniture_app/constants.dart';
import 'package:furniture_app/data/models/address_model.dart';
import 'package:furniture_app/login/address_provider.dart';
import 'package:provider/provider.dart';

import 'add_Address.dart';

class ChooseAddress extends StatefulWidget {
  final AddressModel? address;
  ChooseAddress({this.address});
  @override
  _ChooseAddressState createState() => _ChooseAddressState();
}

class _ChooseAddressState extends State<ChooseAddress> {
  GlobalKey<ScaffoldState> _checkAvailibityKey = GlobalKey<ScaffoldState>();
  List<AddressModel> addressList = [];
  bool isEdit = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var addressProvider = Provider.of<AddressProvider>(context);
    final addList = addressProvider.addressList;
    return Scaffold(
        key: _checkAvailibityKey,
        backgroundColor: kPrimaryColor,
        appBar: AppBar(
          leading: IconButton(
            padding: EdgeInsets.only(left: kDefaultPadding),
            icon:
                SvgPicture.asset("assets/icons/back.svg", color: Colors.white),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          brightness: Brightness.light,
          backgroundColor: kPrimaryColor,
          elevation: 0,
        ),
        body: SafeArea(
          bottom: true,
          child: Column(
            children: <Widget>[
              Align(
                alignment: Alignment.topCenter,
                child: Container(
                  height: 45,
                  width: 250,
                  margin: EdgeInsets.all(kDefaultPadding),

                  decoration: BoxDecoration(
                    color: Color(0xFFFCBF1E),
                    borderRadius: BorderRadius.circular(30),
                  ),
                  // width: double.infinity,
                  // height: 45,
                  child: Center(
                    child: FlatButton(
                        //minWidth: double.infinity,
                        height: 25,
                        child: Text(
                          'Add new address'.toUpperCase(),
                          style: TextStyle(
                              color: kPrimaryColor,
                              fontSize: 18,
                              fontWeight: FontWeight.w500),
                        ),
                        onPressed: () {
                          setState(() {
                            isEdit = false;
                          });
                          Navigation.pushReplacementNavigation(
                            context,
                            AddAddress(
                              isEdit: isEdit,
                            ),
                          );
                        }),
                  ),
                ),
              ),
              SizedBox(height: kDefaultPadding / 2),
              Expanded(
                child: Stack(
                  children: [
                    // Our background
                    Container(
                      margin: EdgeInsets.only(top: 0),
                      decoration: BoxDecoration(
                        color: kBackgroundColor,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(40),
                          topRight: Radius.circular(40),
                        ),
                      ),
                    ),

                    ListView.builder(
                        // here we use our demo procuts list
                        itemCount: addList.length,
                        itemBuilder: (context, index) {
                          return Padding(
                            padding: const EdgeInsets.only(
                                top: 2, left: 12, right: 12, bottom: 8),
                            child: Stack(
                              children: [
                                Container(
                                  //height: 180,
                                  width: double.infinity,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(18),
                                    color: Colors.grey.shade300,
                                    boxShadow: [kDefaultShadow],
                                  ),
                                  child: Container(
                                    width: double.infinity,
                                    margin: EdgeInsets.only(right: 6, top: 4),
                                    decoration: BoxDecoration(
                                      color: Colors.white,
                                      borderRadius: BorderRadius.circular(18),
                                    ),
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                          left: 15, top: 3),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: const EdgeInsets.only(
                                                top: 15, bottom: 5),
                                            child: Text(
                                              addList[index].userName!,
                                              style: TextStyle(fontSize: 26),
                                            ),
                                          ),
                                          Text(
                                            "${addList[index].deliveryAddress},${addList[index].landMark}",
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text(
                                            addList[index].deliveryArea!,
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text(
                                            '${addList[index].city},${addList[index].pinCode}',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Text(
                                            'Mobile Number: ${addList[index].mobileNumber}',
                                            style: TextStyle(fontSize: 18),
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceAround,
                                            children: [
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: kPrimaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  height: 35,
                                                  child: FlatButton(
                                                    child: Text(
                                                      'Edit',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    onPressed: () {
                                                      setState(() {
                                                        isEdit = true;
                                                      });
                                                      Navigation
                                                          .pushReplacementNavigation(
                                                              context,
                                                              AddAddress(
                                                                isEdit: isEdit,
                                                                address:
                                                                    AddressModel(
                                                                  id: addList[
                                                                          index]
                                                                      .id,
                                                                  userName: addList[
                                                                          index]
                                                                      .userName,
                                                                  mobileNumber:
                                                                      addList[index]
                                                                          .mobileNumber,
                                                                  deliveryAddress:
                                                                      addList[index]
                                                                          .deliveryAddress,
                                                                  deliveryArea:
                                                                      addList[index]
                                                                          .deliveryArea,
                                                                  landMark: addList[
                                                                          index]
                                                                      .landMark,
                                                                  city: addList[
                                                                          index]
                                                                      .city,
                                                                  pinCode: addList[
                                                                          index]
                                                                      .pinCode,
                                                                ),
                                                              ));
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    color: kPrimaryColor,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  height: 35,
                                                  child: FlatButton(
                                                    child: Text(
                                                      'Remove',
                                                      style: TextStyle(
                                                          color: Colors.white),
                                                    ),
                                                    onPressed: () {
                                                      addressProvider
                                                          .removeAddress(
                                                              addList[index]);
                                                    },
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          );
                        })
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
