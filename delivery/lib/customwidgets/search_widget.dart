import 'package:flutter/material.dart';

class SearchItem extends StatefulWidget {
  bool isbool = false;
  String title;
  String image;
  int? price;
  String id;
  int? quantity;
  VoidCallback? delete;
  SearchItem(
      {this.delete,
      required this.isbool,
      required this.title,
      required this.image,
      required this.price,
      required this.id,
      required this.quantity});
  @override
  State<SearchItem> createState() => _SearchItemState();
}

class _SearchItemState extends State<SearchItem> {
  //SearchItem({Key? key, required this.isbool,title="kj",image="k"}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    print('widget image');
    print(widget.image);
    //var image2 = Widget.image;
    return Container(
      height: 140,
      child: Column(
        children: [
          Text('dehhhjhjd'),
          Row(
            children: [
              SizedBox(
                height: 10,
              ),
              Expanded(
                  child: Container(
                height: 100,
                child: Center(
                  child:
                      //image!=null?Image.network('https://cdn.britannica.com/17/196817-050-6A15DAC3/vegetables.jpg'):
                      Image.network(widget.image),
                ),
              )),
              Expanded(
                  child: Container(
                height: 100,
                child: Column(
                  mainAxisAlignment: widget.isbool == false
                      ? MainAxisAlignment.spaceAround
                      : MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    widget.title == null
                        ? Text(
                            'ProductName'
                            //widget.image
                            ,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          )
                        : Text(
                            widget.title,
                            style: TextStyle(
                                color: Colors.black,
                                fontWeight: FontWeight.bold),
                          ),
                    Text(
                      '${widget.price}\$/gram',
                      style: TextStyle(
                        color: Colors.grey,
                      ),
                    )
                  ],
                ),
              )),
              widget.isbool == false
                  ? GestureDetector(
                      onTap: () {
                        showModalBottomSheet(
                            context: context,
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                children: <Widget>[
                                  ListTile(
                                    title: new Text('50 gram'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    title: new Text('500 gram'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                  ListTile(
                                    title: new Text('1 kg'),
                                    onTap: () {
                                      Navigator.pop(context);
                                    },
                                  ),
                                ],
                              );
                            });
                      },
                      child: Container(
                        child: Row(
                          children: [
                            Expanded(
                                child: Text(
                              '50\$/GRAM',
                              style:
                                  TextStyle(color: Colors.grey, fontSize: 14),
                            )),
                            Center(
                              child: Icon(
                                Icons.arrow_drop_down,
                                size: 20,
                                color: Colors.yellow,
                              ),
                            ),
                            Expanded(
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 15, vertical: 32),
                                child: Container(
                                  height: 100,
                                  child: Container(
                                    height: 25,
                                    width: 50,
                                    decoration: BoxDecoration(
                                      border: Border.all(color: Colors.grey),
                                      borderRadius: BorderRadius.circular(30),
                                    ),
                                    child: Center(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Icon(
                                            Icons.add,
                                            color: Colors.yellow,
                                            size: 20,
                                          ),
                                          Text(
                                            "Add",
                                            style:
                                                TextStyle(color: Colors.yellow),
                                          )
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            widget.isbool == false
                                ? Container()
                                : Divider(
                                    height: 1,
                                    color: Colors.black,
                                  ),
                            SizedBox(
                              height: 20,
                            ),
                            Divider(
                              height: 2,
                            ),
                          ],
                        ),
                      ),
                    )
                  : Text('50 gram'),
              Container(
                //color: Colors.amberAccent,height: 15,
                child: Row(
                  children: [
                    IconButton(onPressed: () {}, icon: Icon(Icons.add)),
                    IconButton(
                        onPressed: widget.delete, icon: Icon(Icons.delete))
                  ],
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
