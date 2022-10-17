

import 'package:flutter/material.dart';

class SingleDelivery extends StatelessWidget {
  String title;
String address;
String number;
String addresstype;

   SingleDelivery({required this.title,required this.address,required this.number,required this.addresstype}) ;



  @override
  Widget build(BuildContext context) {
    return Column(
      children: [


        Text(title),
       ListTile(
        title: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
width: 60,
padding: EdgeInsets.all(1),
height: 20,
decoration: BoxDecoration(
color:Colors.yellow,
borderRadius:BorderRadius.circular(10)


),child:Center(child:Text(addresstype,style:TextStyle(color:Colors.white,fontSize:13)))



            ),
          ],
        ),
        leading: CircleAvatar(
backgroundColor: Colors.yellow,

radius: 8,

        ),
        subtitle: Column(
mainAxisAlignment: MainAxisAlignment.spaceEvenly,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
  Text(address),
SizedBox(height: 5,)
,Text(number),Divider(height: 2,


)


],

        ),
        ),
      ],
    );






  }
}