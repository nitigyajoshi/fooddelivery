//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// // import 'package:flutter/src/foundation/key.dart';
// import 'package:flutter/src/widgets/framework.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:fooddelivery/customwidgets/counter.dart';
import 'package:fooddelivery/customwidgets/product_unit.dart';
import 'package:fooddelivery/model/product_model.dart';
import 'package:fooddelivery/model/review_cart_model.dart';
import 'package:fooddelivery/provider/product_provider.dart';
import 'package:fooddelivery/provider/review_cart_provider.dart';
import 'package:provider/provider.dart';


/////////////////////////////////////////////////////////
///
class ReviewSingle extends StatefulWidget {
  final String productId;
  final String productImage;
  final String productName;
   final int productPrice;
   final VoidCallback ?onTap;
   int ?productQuantity;
ReviewCartModel unit;
   int i;
  // final String productId;
 
  ReviewSingle(
      {
      required this.unit,
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

class _SingalProductState extends State<ReviewSingle> {
   var unitData;
  var firstValue;
  int count=2;
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
   // productProvider=Provider.of<ProductProvider>(context);
   //reviewCartProvider!.getReviewCartData();
     

///////////////////////
      widget.unit.cartunit.firstWhere((element) {
      setState(() {
        firstValue = element;
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
            width: 300,
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
                              //${widget.productPrice}\$
                              Text('${widget.productPrice}\$/${unitData == null?firstValue:unitData}'),
                              SizedBox(width: 10,),
                              widget.i==1?IconButton(onPressed:(){
                            showAlertDialog(context,widget.productId);
                            
                          }, icon: Icon(Icons.delete),iconSize: 20,):Container(height:0)
                            ],
                                        )              )
                        //,Text('Q: ${widget.productQuantity}'), 

                        
                      ],
                    ),
                  ),
                ),
                
                Row(
                  children: [
InkWell(highlightColor: Colors.yellow,
     child:Text(unitData==null?firstValue:unitData),
onTap: ()async{

  showBottomSheet(context: context, builder:(context){

 return Column(
  //children:[Text('jhj')]
         mainAxisSize: MainAxisSize.min,
        
children: widget.unit.cartunit.map<Widget>((data){
return Column(
children: [Padding(padding: EdgeInsets.symmetric(horizontal: 10,vertical: 10)
,child: InkWell(
onTap: (){
  setState(() async{
    unitData=data;
  });
   Navigator.of(context).pop();
},
child:Expanded(
  child:   
     Text(data,style: TextStyle(
    
      color: Colors.green,fontSize: 25
    
    ),),
 
),
                                                  
)
              )],

);

}).toList()

        );

  });
                                              

    Navigator.pop(context);                                                
  ////////////////////////
},



   ),




SizedBox(height: 5,),

InkWell(
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
 //reviewCartProvider!.updateCart(widget.productId, widget.productName, widget.productImage, widget.productPrice, count);
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

                    
                  ],
                ),
               

            
       
       
       
        ])),
        ],
      ),
    );
  }
}