import 'package:flutter/material.dart';

Widget bottom({
required Color iconcolor,
required Color backgroundColor,
required Color color,
required String title,
required IconData icondata,
 VoidCallback ?onTap
}){
return GestureDetector(onTap: onTap,
  child:   Expanded(child: Container(
  
  padding: EdgeInsets.all(20),
  
  color: backgroundColor,
  
  child: Row(
  
    mainAxisAlignment: MainAxisAlignment.center
  
    ,children: [
  
  Icon(
  
  icondata,
  
  size: 15,
  
  color: iconcolor,
  
  
  
  
  
  )
  
  ,
  
  SizedBox(width: 5,),
  
  
  
  Text(title,style: TextStyle(
  
  color: color
  
  
  
  ),)
  
    //BottomNavigationBar(items: items)
  
  ],),
  
  
  
  
  
  ),),
);
}