import 'package:delivery/payment/order_item.dart';
import 'package:delivery/provider/customert_order_provider.dart';
import 'package:delivery/screens/delivery_details/delivery_single.dart';
import 'package:delivery/screens/home.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../model/delivery_address_model.dart';
import '../provider/review_cart_provider.dart';

class PaymentSummary extends StatefulWidget {
  final DeliveryAddressModel? deliverAddressList;
  PaymentSummary({required this.deliverAddressList});

  @override
  _PaymentSummaryState createState() => _PaymentSummaryState();
}

enum AddressTypes {
  Home,
  OnlinePayment,
}

class _PaymentSummaryState extends State<PaymentSummary> {
  var myType = AddressTypes.Home;

  @override
  Widget build(BuildContext context) {
    ReviewCartProvider reviewCartProvider = Provider.of(context);
    CustomerOrder customer = Provider.of<CustomerOrder>(context);
    reviewCartProvider.getReviewCartData();

    double? discount = 30;
    double? discountValue;
    double? shippingChanrge = 3.7;
    double? total = 0.0;
    double totalPrice = reviewCartProvider.getTotalPrice();
    print(totalPrice);
    if (totalPrice > 300) {
      discountValue = (totalPrice * discount) / 100;
      total = totalPrice - discountValue;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Payment Summary",
          style: TextStyle(fontSize: 18),
        ),
      ),
      bottomNavigationBar: ListTile(
        title: Text("Total Amount"),
        subtitle: Text(
          "\$${total! + totalPrice}",
          style: TextStyle(
            color: Colors.green[900],
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        trailing: Container(
          width: 160,
          child: MaterialButton(
            onPressed: () {
              customer.customerData(widget.deliverAddressList, total!);
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  content: Text(
                      'product ordered sucessfully ... please make the amount ready on the day'),
                  duration: Duration(seconds: 5)));
              // SnackBar(
              //   content: Text('product ordered sucessfully..'),
              //   //  duration: Duration(seconds: 2)
              // );
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Home()));
              // myType == AddressTypes.OnlinePayment
              //     ? Navigator.of(context).push(
              //         MaterialPageRoute(
              //           builder: (context) => MyGooglePay(
              //             total: total,
              //           ),
              //         ),
              //       )
              //     : Container();
            },
            child: Text(
              "Pleace Order",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            color: Colors.yellow,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30),
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.only(top: 10),
        child: ListView.builder(
          itemCount: 1,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SingleDeliveryItem(
                  address:
                      "aera, ${widget.deliverAddressList!.aera}, street, ${widget.deliverAddressList!.street},society ${widget.deliverAddressList!.scoirty}, pincode ${widget.deliverAddressList!.pinCode}",
                  title:
                      "${widget.deliverAddressList!.firstName} ${widget.deliverAddressList!.lastName}",
                  number: widget.deliverAddressList!.mobileNo,
                  addressType: widget.deliverAddressList!.addressType ==
                          "AddressTypes.Home"
                      ? "Home"
                      : widget.deliverAddressList!.addressType ==
                              "AddressTypes.Other"
                          ? "Other"
                          : "Work",
                ),
                Divider(),
                ExpansionTile(
                  children: reviewCartProvider.getReviewCartDataList.map((e) {
                    return OrderItem(
                      e: e,
                    );
                  }).toList(),
                  title: Text(
                      "Order Items ${reviewCartProvider.getReviewCartDataList.length}"),
                ),
                Divider(),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Sub Total",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  trailing: Text(
                    "\$${totalPrice + 5}",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Shipping Charge",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: Text(
                    "\$$discountValue",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                ListTile(
                  minVerticalPadding: 5,
                  leading: Text(
                    "Compen Discount",
                    style: TextStyle(color: Colors.grey[600]),
                  ),
                  trailing: Text(
                    "\$10",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Divider(),
                ListTile(
                  leading: Text("Payment Options"),
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
                    Icons.work,
                    color: Colors.yellow,
                  ),
                ),
                RadioListTile(
                  value: AddressTypes.OnlinePayment,
                  groupValue: myType,
                  title: Text("OnlinePayment"),
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
            );
          },
        ),
      ),
    );
  }
}
