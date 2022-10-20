import 'package:flutter/material.dart';

Widget item3(){
  return 
  
      Container(margin: EdgeInsets.symmetric(horizontal: 6),height: 230,
width: 170,

decoration: BoxDecoration(
  color: Color(0xffd9d8d9),
 // image: DecorationImage(image:NetworkImage('https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg') )
),
      child: Column(
//

  
        ///
        children: [
           Expanded(flex: 2,child: Image.network('https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg')),
    
          Text('Fresh vegitable',style: TextStyle(color: Colors.black,fontWeight: FontWeight.bold),),
  
       Text('Rs 50/kg',style: TextStyle(color: Colors.black,),),
          Container(
            child: OutlinedButton(onPressed: (){}, child:Row(children: [
              Text('50gm',style: TextStyle(color: Colors.green),),Icon(Icons.arrow_drop_down,color: Colors.green,size: 15,),
         
         Icon(Icons.remove,color: Colors.green)
   ,Text('1'),Icon(Icons.add,color: Colors.green) ],
            )
             ),
          ),

        ],
      ),
      
      );

}