import 'package:flutter/material.dart';
import 'package:souq/components/customTextField.dart';

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
      body: Container(
        padding: EdgeInsets.only(top: size.height * 0.060, left: 20, right: 10),
        child: Column(
          children: <Widget>[




            //textfield
            textFormField(),


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
            ListViewCategories(names: names),
            

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Widget>[
              Text('Best Selling', style: TextStyle( fontSize: 20, fontWeight: FontWeight.w600)),
                   FlatButton(
                       onPressed: (){print('see all');},
                       child: Text('See All', style: TextStyle( fontSize: 17))),



            ],)
          ],
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
                      color: Colors.grey.withOpacity(0.3),
                      //color of shadow
                      spreadRadius: 1,
                      //spread radius
                      offset:
                      Offset(0, 01), // changes position of shadow
                      //first paramerter of offset is left-right
                      //second parameter is top to down
                    ),
                    //you can set more BoxShadow() here
                  ],
                  borderRadius: BorderRadius.circular(55),
                  color: Colors.white),
              height: 60,
              width: 60,
              child: Image.asset('assets/homeview/Icon_Mens Shoe.png'),
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
class ListViewCategories extends StatelessWidget {
  const ListViewCategories({
    Key? key,
    required this.names,
  }) : super(key: key);

  final List<String> names;

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
              child: Image.asset('assets/homeview/Icon_Mens Shoe.png'),
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
