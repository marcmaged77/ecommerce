import 'package:flutter/material.dart';
import 'package:souq/components/customTextField.dart';
import 'package:souq/constants.dart';

class homeScreen extends StatelessWidget {
  final List<String> names = <String>[
    'Men',
    'Women',
    'Devices',
    'Gadgets',
    'Gaming',
    's',
    's',
    "s",
  ];






  late String email;
  late String? name;
  late String? pic;

  final TextController1 = TextEditingController();

  homeScreen({
    Key? key,
    required this.email,
    this.name,
    this.pic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var height = size.height;
    var width = size.width;
    return Scaffold(
      resizeToAvoidBottomInset: false,


        appBar: AppBar(
          elevation: 0,
          toolbarHeight: height *0.09, // Set this height

          flexibleSpace:

          Container(
            padding: EdgeInsets.only(top: height * 0.02),
            color: Colors.grey.shade50,
            child: Column(children: <Widget>[
              SizedBox(height: 8),
              Container(
                  margin: EdgeInsets.symmetric(horizontal: 20, vertical: 5),
                  child:  textFormField()),
            ]),
          ),


        ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only( left: 20, right: 10),
          child: Column(
            children: <Widget>[




              //textfield


              SizedBox(
                height: 30,
              ),
              Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Categories",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  )),
              SizedBox(
                height: 30,
              ),


              //listview
              ListViewCategories(names: names, ),


              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                Text('Best Selling', style: TextStyle( fontSize: 20, fontWeight: FontWeight.w600)),
                     FlatButton(
                         onPressed: (){print('see all');},
                         child: Text('See All', style: TextStyle( fontSize: 17))),



              ],),


              ListViewProducts(names: names),
              SizedBox(height: 1000,)
            ],
          ),
        ),
      ),
    );
  }
}



class ListViewProducts extends StatelessWidget {
  const ListViewProducts({
    Key? key,
    required this.names,
  }) : super(key: key);

  final List<String> names;


  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    var height = size.height;
    var width = size.width;
    return Container(
      height: height * 1,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Column(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      //color of shadow
                      spreadRadius: 1,
                      //spread radius
                      offset:
                      Offset(0, 001), // changes position of shadow
                      //first paramerter of offset is left-right
                      //second parameter is top to down
                    ),
                    //you can set more BoxShadow() here
                  ],
                  color: Colors.white),
              height: height * .4,
              width: width * .4,
              child: Column(
                children:<Widget> [
                  Container(
                   child:   Image.asset('assets/homeview/product2.png')
                  ),
                  SizedBox(height: height * 0.003,),
                  Container(
                    padding: EdgeInsets.only(left: 5),
                      alignment: Alignment.topLeft,
                      child: Text("Leather Wrist Watch",style: TextStyle(fontSize: 17),)),

                  Container(
                      padding: EdgeInsets.only(left: 5),
                      alignment: Alignment.topLeft,
                      child: Text("Leather Wrist Watch",style: TextStyle(fontSize: 13, color: Colors.grey),)),

                  Container(
                      padding: EdgeInsets.only(left: 5, top: 10),
                      alignment: Alignment.topLeft,
                      child: Text("700 Egp",style: TextStyle(fontSize: 17, color: kPrimaryColor),)),


                ],

              )
            ),

          ]);
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 20,
        ),
      ),
    );
  }
}


class ListViewCategories extends StatelessWidget {
   ListViewCategories({
    Key? key,

    required this.names,
  }) : super(key: key);

  final List<String> names;

  final List <String> imgs = <String> [
    'assets/homeview/Icon_Mens Shoe.png',
    'assets/homeview/women.png',
    'assets/homeview/Devices.png',
    'assets/homeview/Icon_Gadgets.png',
    'assets/homeview/Icon_Gaming.png',
    'assets/homeview/Icon_Gaming.png',
    'assets/homeview/Icon_Gaming.png',
    'assets/homeview/Icon_Gaming.png',



  ];




  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100,
      child: ListView.separated(
        scrollDirection: Axis.horizontal,
        itemCount: names.length,
        itemBuilder: (context, index) {
          return Column(children: <Widget>[
            Container(
              decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.1),
                      //color of shadow
                      spreadRadius: 0.1,
                      //spread radius
                      offset:
                          Offset(0, 001), // changes position of shadow
                      //first paramerter of offset is left-right
                      //second parameter is top to down
                    ),
                    //you can set more BoxShadow() here
                  ],
                  borderRadius: BorderRadius.circular(55),
                  color: Colors.white),
              height: 60,
              width: 60,
              child: Image.asset(imgs[index]),
            ),
            SizedBox(
              height: 10,
            ),
            Text(names[index])
          ]);
        },
        separatorBuilder: (context, index) => SizedBox(
          width: 20,
        ),
      ),
    );
  }
}

class textFormField extends StatelessWidget {
  const textFormField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: Colors.grey.shade300,
      ),
      child: TextFormField(
        decoration: InputDecoration(
            border: InputBorder.none,
            prefixIcon: Icon(
              Icons.search,
              color: Colors.black,
            )),
      ),
    );
  }
}
