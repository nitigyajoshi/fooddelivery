import 'package:flutter/material.dart';

Widget upperhome(){
return     Container(
    
    height: 178,
    
    decoration: BoxDecoration(
    
    borderRadius: BorderRadius.circular(10)
    
    ,image: DecorationImage(opacity: 5,fit: BoxFit.cover,
    image: NetworkImage('https://th.bing.com/th/id/R.e1ccfa1103a9255b590cee97ce52535f?rik=c1%2fCsJzyA%2b6KWw&riu=http%3a%2f%2fdiet234.com%2fwp-content%2fuploads%2f2015%2f10%2fjw199-350a-fresh-vegetable-juice_1920x1200_59997.jpg&ehk=9uEZ7EoJETaDVGGpiZGoia7AprNM%2b3xDmgKwbgLCx2s%3d&risl=&pid=ImgRaw&r=0'))
    
    ),
    
    child: Row(children: [
    
    Expanded(
    
      child:   Container(
    width: 25,
      //40
  
      decoration: BoxDecoration(
    
      
    
      borderRadius: BorderRadius.circular(10)
    
      
      ),
    
        child: Expanded(
    
          child: Row(children: [
    
         Container(
    width: 350,
       // color: Colors.red,
    
  
       child: Padding(
         padding: const EdgeInsets.only(left: 3,right: 90,top: 5,bottom: 95),
         child: Column(
           children: [
             Container(
                 child: Text('Vegi',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white,shadows:
                 [ BoxShadow(color: Colors.green,
                blurRadius: 10,
                offset: Offset(3, 3) 
                 )]
             )),
  decoration: BoxDecoration(
    
                //color: Colors.red,
    
                color:Color(0xffd1ad17),
    
                borderRadius: BorderRadius.only(
  
                bottomRight:Radius.circular(20) ,
  
                bottomLeft: Radius.circular(20)
  
                )
  
                ),
    
                
                  /////////
                ),
                Expanded(
       child: Text('30% off',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 25,color: Colors.white,shadows:
                     [ BoxShadow(color: Colors.green,
                    blurRadius: 10,
                    offset: Offset(3, 3) 
                     )]
                 )),
     ),
  
  
  
           ],
         ),
            
       ),
    
          ),
    
  
      ]
           ),
    
        ),
    
      
    
      
    
      ),
    
    )
    
    
    
    ],),
    
    );
}