// import 'package:flutter/material.dart';
// import 'package:flutter_svg/svg.dart';
// import 'package:furniture_app/Utils/navigator_class.dart';
// import 'package:furniture_app/Utils/text_field.dart';
// import 'package:furniture_app/constants.dart';
// import 'package:furniture_app/data/models/address_model.dart';
// import 'package:provider/provider.dart';

// import 'choose_address.dart';

// // ignore: must_be_immutable
// class AddAddress extends StatefulWidget {
//   final AddressModel? address;
//   final bool? isEdit;
//   AddAddress({this.address, this.isEdit});
//   @override
//   _AddAddressState createState() => _AddAddressState();
// }

// class _AddAddressState extends State<AddAddress> {
//   TextEditingController nameController = TextEditingController();
//   TextEditingController mobileNoController = TextEditingController();
//   TextEditingController pinCodeController = TextEditingController();
//   TextEditingController deliveryAddController = TextEditingController();
//   TextEditingController deliveryAreaController = TextEditingController();
//   TextEditingController landmarkController = TextEditingController();
//   TextEditingController cityController = TextEditingController();
//   AddressModel? address;
//   bool canPress = false;
//   bool? isEdit;

//   validateEntries() {
//     var canHit = nameController.text.isNotEmpty &&
//         nameController.text != null &&
//         mobileNoController.text.isNotEmpty &&
//         mobileNoController.text != null &&
//         pinCodeController.text.isNotEmpty &&
//         pinCodeController.text != null &&
//         deliveryAddController.text.isNotEmpty &&
//         deliveryAddController.text != null &&
//         deliveryAreaController.text.isNotEmpty &&
//         deliveryAreaController.text != null &&
//         cityController.text.isNotEmpty &&
//         cityController.text != null;

//     if (canHit) {
//       setState(() {
//         canPress = true;
//       });
//     } else {
//       setState(() {
//         canPress = false;
//       });
//     }
//   }

//   @override
//   void initState() {
//     setState(() {
//       isEdit = widget.isEdit;
//     });
//     nameController.addListener(() {
//       validateEntries();
//     });
//     mobileNoController.addListener(() {
//       validateEntries();
//     });
//     pinCodeController.addListener(() {
//       validateEntries();
//     });
//     deliveryAddController.addListener(() {
//       validateEntries();
//     });
//     deliveryAreaController.addListener(() {
//       validateEntries();
//     });
//     cityController.addListener(() {
//       validateEntries();
//     });
//     super.initState();
//     if (isEdit == true) {
//       setState(() {
//         address = widget.address;
//       });
//       nameController.text = address!.userName!;
//       mobileNoController.text = address!.mobileNumber!;
//       pinCodeController.text = address!.pinCode!;
//       deliveryAddController.text = address!.deliveryAddress!;
//       deliveryAreaController.text = address!.deliveryArea!;
//       landmarkController.text = address!.landMark!;
//       cityController.text = address!.city!;
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     var addressProvider = Provider.of<AddressProvider>(context);
//     final addProList = addressProvider.addressList;
//     return Scaffold(
//       backgroundColor: kPrimaryColor,
//       appBar: AppBar(
//         leading: IconButton(
//           padding: EdgeInsets.only(left: kDefaultPadding),
//           icon: SvgPicture.asset("assets/icons/back.svg"),
//           onPressed: () {
//             Navigator.pop(context);
//           },
//         ),
//         backgroundColor: kBackgroundColor,
//         elevation: 0,
//         title: Text(
//           'Add Address',
//           style: TextStyle(color: kPrimaryColor, fontSize: 22),
//         ),
//       ),
//       body: SingleChildScrollView(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Container(
//               width: double.infinity,
//               padding: EdgeInsets.symmetric(horizontal: kDefaultPadding),
//               decoration: BoxDecoration(
//                 color: kBackgroundColor,
//                 borderRadius: BorderRadius.only(
//                   bottomLeft: Radius.circular(50),
//                   bottomRight: Radius.circular(50),
//                 ),
//               ),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   TextInputField(
//                     controller: nameController,
//                     hintText: 'Name',
//                   ),
//                   TextInputField(
//                     controller: mobileNoController,
//                     hintText: 'Mobile no.',
//                   ),
//                   TextInputField(
//                     controller: pinCodeController,
//                     hintText: 'PIN code',
//                   ),
//                   TextInputField(
//                     controller: deliveryAddController,
//                     hintText: 'Flat, House no., Building, Apartment, Co..',
//                   ),
//                   TextInputField(
//                     controller: deliveryAreaController,
//                     hintText: 'Area, Colony, Street, Sector, Village',
//                   ),
//                   TextInputField(
//                     controller: landmarkController,
//                     hintText: 'Landmark e.g. near Hindustan Hotel ',
//                   ),
//                   TextInputField(
//                     controller: cityController,
//                     hintText: 'Town/City',
//                   ),
//                   SizedBox(
//                     height: 45,
//                   )
//                 ],
//               ),
//             ),
//             Padding(
//               padding: const EdgeInsets.only(
//                   top: 15.0, left: 10, right: 10, bottom: 20),
//               child: Center(
//                 child: Container(
//                   height: 55,
//                   margin: EdgeInsets.all(kDefaultPadding - 10),
//                   padding: EdgeInsets.symmetric(
//                     horizontal: kDefaultPadding * 3,
//                     vertical: kDefaultPadding / 2,
//                   ),
//                   decoration: BoxDecoration(
//                     color: Color(0xFFFCBF1E),
//                     borderRadius: BorderRadius.circular(30),
//                   ),
//                   child: FlatButton(
//                     height: 45,
//                     child: Text(
//                       'Add Address'.toUpperCase(),
//                       style: TextStyle(
//                           color: kPrimaryColor,
//                           fontWeight: FontWeight.w500,
//                           fontSize: 18),
//                     ),
//                     onPressed: canPress
//                         ? () {
//                             addressProvider.addAddress(
//                               AddressModel(
//                                   id: isEdit!
//                                       ? address!.id
//                                       : (addProList.isNotEmpty)
//                                           ? addProList.length + 1
//                                           : 1,
//                                   userName: nameController.text,
//                                   mobileNumber: mobileNoController.text,
//                                   pinCode: pinCodeController.text,
//                                   deliveryAddress: deliveryAddController.text,
//                                   deliveryArea: deliveryAreaController.text,
//                                   landMark: landmarkController.text,
//                                   city: cityController.text),
//                             );
//                             Navigation.pushReplacementNavigation(
//                                 context, ChooseAddress());
//                           }
//                         : null,
//                   ),
//                 ),
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
