import 'package:flutter/material.dart';

import 'package:provider/provider.dart';

import '../../../customwidgets/custom_textfield.dart';
import '../../../google_map/google_map.dart';
import '../../../provider/check_out_provider.dart';

class AddDeliverAddress extends StatefulWidget {
  @override
  _AddDeliverAddressState createState() => _AddDeliverAddressState();
}

enum AddressTypes {
  Home,
  Work,
  Other,
}

class _AddDeliverAddressState extends State<AddDeliverAddress> {
  var myType = AddressTypes.Home;
  @override
  Widget build(BuildContext context) {
    CheckoutProvider checkoutProvider = Provider.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Add Delivery Address",
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: Container(
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        height: 48,
        child: checkoutProvider.isloadding == false
            ? MaterialButton(
                onPressed: () {
                  checkoutProvider.validator(context, myType);
                },
                child: Text(
                  "Add Address",
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
                color: Colors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                ),
              )
            : Center(
                child: CircularProgressIndicator(),
              ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 20,
        ),
        child: ListView(
          children: [
            CostomField(
              labelText: "First name",
              controller: checkoutProvider.firstName,
            ),
            CostomField(
              labelText: "Last name",
              controller: checkoutProvider.lastName,
            ),
            CostomField(
              labelText: "Mobile No",
              controller: checkoutProvider.mobileNo,
            ),
            CostomField(
              labelText: "Alternate Mobile No",
              controller: checkoutProvider.alternateMobileNo,
            ),
            CostomField(
              labelText: "Scoiety",
              controller: checkoutProvider.scoiety,
            ),
            CostomField(
              labelText: "Street",
              controller: checkoutProvider.street,
            ),
            CostomField(
              labelText: "Landmark",
              controller: checkoutProvider.landmark,
            ),
            CostomField(
              labelText: "City",
              controller: checkoutProvider.city,
            ),
            CostomField(
              labelText: "Aera",
              controller: checkoutProvider.aera,
            ),
            CostomField(
              labelText: "Pincode",
              controller: checkoutProvider.pincode,
            ),
            InkWell(
              onTap: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => CostomGoogleMap(),
                  ),
                );
              },
              child: Container(
                height: 47,
                width: double.infinity,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    checkoutProvider.setLoaction == null
                        ? Text("Set Loaction")
                        : Text("Done!"),
                  ],
                ),
              ),
            ),
            Divider(
              color: Colors.black,
            ),
            ListTile(
              title: Text("Address Type*"),
            ),
            RadioListTile(
              value: AddressTypes.Home,
              groupValue: myType,
              title: Text("Home"),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.home,
                color: Colors.yellow,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Work,
              groupValue: myType,
              title: Text("Work"),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.work,
                color: Colors.yellow,
              ),
            ),
            RadioListTile(
              value: AddressTypes.Other,
              groupValue: myType,
              title: Text("Other"),
              onChanged: (AddressTypes? value) {
                setState(() {
                  myType = value!;
                });
              },
              secondary: Icon(
                Icons.devices_other,
                color: Colors.yellow,
              ),
            )
          ],
        ),
      ),
    );
  }
}
