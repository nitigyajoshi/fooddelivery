import 'package:flutter/material.dart';

import '../screens/product_overview.dart';

Widget item2(BuildContext con){
  return 
  
      Container(margin: EdgeInsets.symmetric(horizontal: 6),height: 230,
width: 170,

decoration: BoxDecoration(
  color: Color(0xffd9d8d9),
 // image: DecorationImage(image:NetworkImage('https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg') )
),
      child: Column(
//
//https://www.youtube.com/watch?v=v9MzpMpfDto&list=PLQrn8asEsczrgB06s8apKMXfKpqWRhF49&index=14
  //https://www.youtube.com/watch?v=v9MzpMpfDto&list=PLQrn8asEsczrgB06s8apKMXfKpqWRhF49&index=14
        ///
        children: [
   Expanded(flex: 2,child: Image.network('https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg')),
    
   Text('Fresh vegitable',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
  
       Text('Rs 50/kg',style: TextStyle(color: Colors.black,),),
          Container(
  //           child: OutlinedButton(onPressed: (){Navigator.of(con).pushReplacement(MaterialPageRoute(builder: (con)=>
  //           ProductOverview(productname:"Fresh vegitable",productimage:"https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg")
  //           )
  //           );
  //           }, child:Row(children: [
  //    Text('50gm',style: TextStyle(color: Colors.green),),Icon(Icons.arrow_drop_down,color: Colors.green,size: 15,),
         
  //        Icon(Icons.remove,color: Colors.green)
  //  ,Text('1'),Icon(Icons.add,color: Colors.green) ],
  //           )
  //            ),
          ),

        ],
      ),
      
      );

}