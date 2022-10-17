

import 'package:flutter/material.dart';
import 'package:fooddelivery/payment/order_item.dart';
class Payment extends StatefulWidget {
  const Payment({Key? key}) : super(key: key);

  @override
  State<Payment> createState() => _PaymentState();
}
enum addresstype{Homedelivery,onlinePayment}
class _PaymentState extends State<Payment> {
  var myType=addresstype.Homedelivery;
  @override
  Widget build(BuildContext context) {
   return Scaffold(appBar: AppBar(title: Text('Payment Summary',style: TextStyle(
    fontSize:13
   ),),),
   bottomNavigationBar: ListTile(
title: Text('Total Amount'),
subtitle: Text('\$300',style: TextStyle(fontWeight: FontWeight.bold,color: Colors.green,fontSize: 15),),
trailing: Container(width: 150,
child: MaterialButton(color: Colors.yellow,shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(3)),
onPressed: (){

},
child: Text('Confirm Order'),
),
),
   ),body: ListView.builder(
    itemCount: 1,
    itemBuilder: (context,index){
      return Column(
children: [
ListTile(
title: Text('Name'),
subtitle: Text('Address'),

),
Divider(
  height: 2,
),
ExpansionTile(title: Text('Order Item 6'),
children: [
  Orderitem(),
Orderitem(),
Orderitem(),
Orderitem(),
Orderitem(),


],

),Divider(),
ListTile(
minVerticalPadding:5 ,
//leading: Text('100 dollar',style: TextStyle(fontWeight: FontWeight.bold),),
trailing: Text('199 dollar',style: TextStyle(fontWeight: FontWeight.bold)),
leading: Text('Sub total',style: TextStyle(fontWeight: FontWeight.bold),),



),
ListTile(
minVerticalPadding:5 ,
//leading: Text('100 dollar',style: TextStyle(fontWeight: FontWeight.bold),),
trailing: Text('Shipping Charge',style: TextStyle(fontWeight: FontWeight.bold)),
leading: Text('20 dollar',style: TextStyle(fontWeight: FontWeight.bold),),

),
ListTile(
minVerticalPadding:5 ,
//leading: Text('100 dollar',style: TextStyle(fontWeight: FontWeight.bold),),
leading: Text('Payment Option',style: TextStyle(fontWeight: FontWeight.bold),),

),
RadioListTile(
  title: Text('Home Dellivery'),
  value: addresstype.Homedelivery, groupValue: myType,
  secondary: Icon(Icons.home,color: Colors.yellow,),
     onChanged:(addresstype ?value){
setState(() {
  myType=value!;
});


} ),
RadioListTile(
  title: Text('Pay Online'),
  value: addresstype.onlinePayment, groupValue: myType,
  secondary: Icon(Icons.work,color: Colors.yellow,),
  onChanged:(addresstype ?value){
setState(() {
  myType=value!;
});


}),

],
      );
    },
   )); 
  }
}