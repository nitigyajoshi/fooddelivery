
import 'package:flutter/material.dart';
import 'package:fooddelivery/customwidgets/custom_textfield.dart';
import 'package:fooddelivery/provider/check_out_provider.dart';
import 'package:provider/provider.dart';

class AddDelivery extends StatefulWidget {
  const AddDelivery({Key? key}) : super(key: key);

  @override
  State<AddDelivery> createState() => _AddDeliveryState();
}
enum addresstype{Home,Work,other}
class _AddDeliveryState extends State<AddDelivery> {


  var myType=addresstype.Home;
  @override
  Widget build(BuildContext context) {
Check_out_provider check_out_provider=Provider.of(context);
  var adressType=addresstype.Home=="";


    return Scaffold(appBar: AppBar(title: Text('Add Delivery'),backgroundColor: Colors.yellow,),
bottomNavigationBar: Container(
margin: EdgeInsets.symmetric(horizontal:10 ,vertical:20),
height: 48,
child:check_out_provider.isLoading==false? MaterialButton(
                onPressed: () {
                  check_out_provider.validator(context,myType);
                },
                child: Text(
                  "Add Address",
                  style: TextStyle(
                    color:Colors.black,
                  ),
                ),
                color: Colors.yellow,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(
                    30,
                  ),
                ),

            ):Center(
              child: CircularProgressIndicator(),
            )
///////////////

),
body: ListView(
children: [
CostomField(labelText: "First Name",),
CostomField(labelText: "Last Name",),
CostomField(labelText: "Phone Number",),
CostomField(labelText: "Email",),
CostomField(labelText: "District",),
CostomField(labelText: "City",),
CostomField(labelText: "Street ",),
CostomField(labelText: "Additional Number",),
CostomField(labelText: "Landmark",),
//CostomField(labelText: "Email",),
//CostomField(labelText: "LandMark",),
InkWell(
child: Container(
  height: 40,
  width: double.infinity,
child: Column(
mainAxisAlignment: MainAxisAlignment.center,
crossAxisAlignment: CrossAxisAlignment.start,
children: [
Text('Set Location')

],



),

),

  onTap: (){


  },
)
,Divider(height: 1,color: Colors.black,)
,ListTile(title: Text("Address type *"),),

RadioListTile(
  title: Text('Home'),
  value: addresstype.Home, groupValue: myType,
  secondary: Icon(Icons.home,color: Colors.yellow,),
     onChanged:(addresstype ?value){
setState(() {
  myType=value!;
});


} ),
RadioListTile(
  title: Text('work'),
  value: addresstype.Work, groupValue: myType,
  secondary: Icon(Icons.work,color: Colors.yellow,),
  onChanged:(addresstype ?value){
setState(() {
  myType=value!;
});


}),
RadioListTile(
  title: Text('other'),
  value: addresstype.other, groupValue: myType,
  secondary: Icon(Icons.other_houses_rounded,color: Colors.yellow,),
   onChanged:(addresstype ?value){
setState(() {
  myType=value!;
});


} ),
],

),
    );
  }
}