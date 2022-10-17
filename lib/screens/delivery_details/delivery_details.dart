

import 'package:flutter/material.dart';
import 'package:fooddelivery/payment/payment.dart';
import 'package:fooddelivery/screens/delivery_details/delivery_single.dart';
import 'package:fooddelivery/screens/delivery_details/delivry_address/add_delivery_address.dart';

class Delivery extends StatefulWidget {
  const Delivery({Key? key}) : super(key: key);

  @override
  State<Delivery> createState() => _DeliveryState();
}

class _DeliveryState extends State<Delivery> {
  List<Widget> adress=[
SingleDelivery(
title:"Nitigya Joshi",
addresstype:"Home",
address:"Dhangadhi Kailali,Jagadamba Tol, Ward 5 ,Hasanpur,Nepal",
number:"+9779846894259"
    
  )

  ];

  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
appBar: AppBar(backgroundColor: Colors.yellow,title: Text('Delivery Details',),),
bottomNavigationBar: Container(
child: MaterialButton(color: Colors.yellow,shape: 
RoundedRectangleBorder(
  borderRadius: BorderRadius.circular(4)),onPressed: (){

adress.isEmpty?Navigator.of(context).push(MaterialPageRoute(builder: (context)=>AddDelivery())):Navigator.of(context).push(MaterialPageRoute(builder: (context)=>Payment()));


},child:adress.isEmpty?Text("Add New Address"):Text('payment summary'),


),

),
body: ListView(

children: [
ListTile(
  title: Text('Deliver To'),
  leading: Icon(Icons.gps_fixed,size: 20,),
)
,Divider(
  height: 1,
)
,Column(children: [
  //dress.isEmpty?Container():adress

  adress.isEmpty?Container():SingleDelivery(
title:"Nitigya Joshi",
addresstype:"Home",
address:"Dhangadhi Kailali,Jagadamba Tol, Ward 5 ,Hasanpur,Nepal",
number:"+9779846894259"
    
  )


],)

],

),
    );

  }
}