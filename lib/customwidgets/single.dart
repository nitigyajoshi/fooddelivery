

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
//import 'package:fooddelivery/customwidgets/counter.dart';
import 'package:fooddelivery/customwidgets/product_unit.dart';
import 'package:fooddelivery/model/product_model.dart';
import 'package:fooddelivery/model/review_cart_model.dart';
import 'package:fooddelivery/provider/product_provider.dart';
import 'package:fooddelivery/provider/review_cart_provider.dart';
import 'package:provider/provider.dart';


/////////////////////////////////////////////////////////
///
class SingalProduct extends StatefulWidget {
  final String productId;
  final String productImage;
  final String productName;
   final int productPrice;
   final VoidCallback ?onTap;
   int ?productQuantity;
   final ProductModel productunit;
   int i;
  // final String productId;
 
  SingalProduct(
      {
        required this.productunit,
        //this.productId,
      required this.productImage,
      required this.productName,
required this.productQuantity,
   this.onTap,
      required this.productPrice,required this.productId
      
      ,required this.i
      });
  @override
  _SingalProductState createState() => _SingalProductState();
}

class _SingalProductState extends State<SingalProduct> {
  
  int count=2;
var unitData;
var firstValue;

 @override
 void initState() {
   getCount();
   super.initState();
   
 }
  getCount(){

setState(() {
  count=widget.productQuantity!;
});

  }
  ReviewCartProvider ?reviewCartProvider;
  ProductProvider ?productProvider;

  showAlertDialog(BuildContext context,String id ) {

    // set up the buttons
    Widget cancelButton = MaterialButton(
      child: Text("No"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );
    Widget continueButton = MaterialButton(
      child: Text("Yes"),
      onPressed: () {
        reviewCartProvider!.deleteReview(id);
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      title: Text("Cart Product"),
      content: Text("Are you delete  cartProduct?"),
      actions: [
        cancelButton,
        continueButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return alert;
      },
    );
  }


  @override
  Widget build(BuildContext context) {

    reviewCartProvider = Provider.of<ReviewCartProvider>(context);
    productProvider=Provider.of<ProductProvider>(context);
    reviewCartProvider!.getReviewCartData();
     widget.productunit.productunit.firstWhere((element){
setState(() {
  firstValue=element;
});
return true;
     });
  
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
     
          Container(
            margin: EdgeInsets.only(right: 10),
            height: 230,
            width: 165,
            decoration: BoxDecoration(
              color: Color(0xffd9dad9),
              borderRadius: BorderRadius.circular(10),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                GestureDetector(
                  onTap: widget.onTap,
                  child: Container(
                    height: 150,
                    padding: EdgeInsets.all(5),
                    width: double.infinity,
                    child: Image.network(
                      widget.productImage,
                    ),
                  ),
                ),
                Expanded(
                  flex: 2,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.productName,
                          style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Expanded(
                          child: Row(
                            children: [
                              SizedBox(height: 15,child: Text('${widget.productPrice}\$/${unitData==null?firstValue:unitData}')),
                              SizedBox(width: 10,),
                              widget.i==1?IconButton(onPressed:(){
                            showAlertDialog(context,widget.productId);
                          }, icon: Icon(Icons.delete),iconSize: 20,):Container(height:0)
                            ],
                          ),
                        )
                        // Text(
                        //   '${widget.productPrice}\$/${unitData == null?firstValue:unitData}',
                        //   style: TextStyle(
                        //     color: Colors.grey,
                        //   ),
                        // ),
                        
                      //  , SizedBox(
                      //     height: 5,
                      //   ),
                        
                      ],
                    ),
                  ),
                ),
                
                Row(
                  children: [
Container(height: 22,
  child:   ElevatedButton(
  
    style:  ElevatedButton.styleFrom(
  
                primary: Colors.green,
  
                onPrimary: Colors.white,
  
                shadowColor: Colors.greenAccent,
  
                elevation: 3,
  
                shape: RoundedRectangleBorder(
  
                    borderRadius: BorderRadius.circular(32.0)),  ) 
    ,onPressed: (){
  },
    child:   ProductUnit(title: unitData==null?firstValue:unitData, onTap: (){
    showModalBottomSheet(
        context: context,
        builder: (context) {
          return Column(

            mainAxisSize: MainAxisSize.min,
  
    
  
            children:widget.productunit.productunit.map<Widget>((data){
  
    
  
    return Column(
  
    
  
    children: [
  
    
  
      InkWell(
 
    onTap:()async{
  
    unitData=data;
  
      Navigator.pop(context);

    },
  
    
  
    child: ListTile(title: Text(data,
  
    //style: TextStyle(fontSize: 15),
    )
  
    ),

      )
  
    
  
    ],
  
    
  
    
  
    
  
    );
  
    
  
            }).toList(),
  
    
  
            // children: <Widget>[
  
    
  
             
  
    
  
            //   ListTile(
  
    
  
      
  
    
  
            //     title: new Text('50 gram'),
  
    
  
            //     onTap: () {
  
    
  
            //       Navigator.pop(context);
  
    
  
            //     },
  
    
  
            //   ),
  
    
  
            //   ListTile(
  
    
  
            //     title: new Text('500 gram'),
  
    
  
            //     onTap: () {
  
    
  
            //       Navigator.pop(context);
  
    
  
            //     },
  
    
  
            //   ),
  
    
  
            //   ListTile(
  
    
  
            //     title: new Text('1 kg'),
  
    
  
            //     onTap: () {
  
    
  
            //       Navigator.pop(context);
  
    
  
            //     },
  
    
  
            //   ),
  
    
  
            // ],
  
    
  
         );
  
    
  
        });
  
    
  
    
  
    
  
    
  
    
  
    }),
  
  ),
)

//                     Row(
//                       children: [
//                         InkWell(onTap:(){
// showModalBottomSheet(
//     context: context,
//     builder: (context) {
//       return Column(
//         mainAxisSize: MainAxisSize.min,
//         children: <Widget>[
         
//           ListTile(
  
//             title: new Text('50 gram'),
//             onTap: () {
//               Navigator.pop(context);
//             },
//           ),
//           ListTile(
//             title: new Text('500 gram'),
//             onTap: () {
//               Navigator.pop(context);
//             },
//           ),
//           ListTile(
//             title: new Text('1 kg'),
//             onTap: () {
//               Navigator.pop(context);
//             },
//           ),
//         ],
//       );
//     });


//                         } ,child: Container(decoration: BoxDecoration(borderRadius:BorderRadius.circular(2)
// ,
// border: Border.all(color: Colors.yellowAccent,
// )

//  ),height: 20,width: 65,child: Text('50gm'),),),
//                           ],
//                     ),
,InkWell(
  onTap:(){
if(count==1){
  Fluttertoast.showToast(msg: "cant be less than 1");
}
else{
  setState(() {
    count--;
  });
  reviewCartProvider!.updateCart(widget.productId, widget.productName, widget.productImage, widget.productPrice, count);

}

},child:Icon(Icons.remove)),
Text("${count}"),
InkWell(onTap:(){
setState(() {
  count++;
});
 reviewCartProvider!.updateCart(widget.productId, widget.productName, widget.productImage, widget.productPrice, count);
//productProvider!.updateProduct(cou,widget.productId);
},
child:Icon(Icons.add)
)

                        //  Counter(productId: widget.productId,
                        //  productimage: widget.productImage,
                        //  productName: widget.productName,
                        //  productPrice: widget.productPrice,
                        //  productQuantity: 1,
                         
                        //  )
                    
                  ],
                ),
               

            //     Row(children: [
            //       Container(
            //         height: 20,width: 65,child: Row(children: [Text('50gm'),
            //       // Counter()
            //       ]
            //       ,
            //       )
            //   ],
            // ),
       
       
       
       
        ])),
        ],
      ),
    );
  }
}