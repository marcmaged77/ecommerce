
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq/components/button.dart';
import 'package:souq/components/customTextField.dart';
import 'package:souq/constants.dart';
import 'package:souq/core/view_model/home_view_model.dart';
import 'package:souq/view/HomeScreen/seeAll/see_all.dart';
import 'package:souq/view/categories/category_view.dart';
import 'package:souq/view/widgets/detailsView/detail_view.dart';


















class homeScreen extends  StatelessWidget {






  //
   String email;
   String name;
   String pic;

  final TextController1 = TextEditingController();

  homeScreen({
    Key key,
     this.email,
    this.name,
    this.pic,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var height = size.height;
    var width = size.width;
    return GetBuilder<HomeViewModel>(
init: Get.find(),
      builder: (controller)=>

      controller.loading.value == true ? Center(child: CircularProgressIndicator()) :

      Scaffold(



          body: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only( left: 20, right: 10),
              child: Column(
                children: <Widget>[




                  //textfield
                  // textFormField(),
button(widthP: 4, color: Colors.black, text: 'fetch',radius: 2,textColor: Colors.white, press: (){
  print(controller.categories.length);
},),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                      alignment: Alignment.topLeft,
                      child: Text(
                        "Categories",
                        style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600, fontFamily: 'first'),
                      )),
                  SizedBox(
                    height: 30,
                  ),


                  //listview
                  ListViewCategories(),
                  SizedBox(
                    height: 40,
                  ),


                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: <Widget>[
                    Text('Best Selling', style: TextStyle( fontSize: 20, fontWeight: FontWeight.w600)),
                         FlatButton(
                             onPressed: (){
                               Get.to(All());


                               print('see all');},
                             child: Text('See All', style: TextStyle( fontSize: 17))),



                  ],),
                  SizedBox(
                    height: 20,

                  ),


                  ListViewProducts(),
                  SizedBox(height: 1000,)
                ],
              ),
            ),
          ),
        ),
    );

  }


}



class ListViewProducts extends StatelessWidget {
  const ListViewProducts({
    Key key,

  }) : super(key: key);




  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;

    var height = size.height;
    var width = size.width;
    return



      GetBuilder<HomeViewModel>(
        builder:(controller) => Container(
        height: 305,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.mostSelling.length,
          itemBuilder: (context, index) {
            return Column(children: <Widget>[
              SizedBox(height: 5,),
              Container(

                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.1),
                        //color of shadow
                        spreadRadius: 0.5,
                        //spread radius
                        offset:
                        Offset(0, 1), // changes position of shadow
                        //first paramerter of offset is left-right
                        //second parameter is top to down
                      ),
                      //you can set more BoxShadow() here
                    ],
                    color: Colors.white),
                height: height * .256,
                width: width * .36,
                // child: FlatButton(
                //   onPressed: (){
                //     Get.to(DetailScreen(model: controller.productModel[index],));
                //
                //   },
                  child: InkWell(
                    onTap: (){
                      Get.to(DetailScreen(model: controller.mostSelling[index],));

                    },
                    child: Stack(
                      fit: StackFit.passthrough,
                      children:[

                        Container(


                          child:  (controller.mostSelling[index].pic == null)
                              ? Image.asset('assets/homeview/product2.png',width: 250,)

                              : Image.network(controller.mostSelling[index].pic,fit: BoxFit.cover,height: 170, width: 200,
                            loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                              if (loadingProgress == null) return child;
                              return Center(
                                child: CircularProgressIndicator(
                                  value: loadingProgress.expectedTotalBytes != null ?
                                  loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                                      : null,
                                ),
                              );
                            },
                          ),
                        ),
                 ] ),
                  ),
                ),
              SizedBox(height: 10,),
              Container(
                decoration: BoxDecoration(
                    boxShadow: [
                      BoxShadow(

                        color: Colors.black.withOpacity(0.1),
                        //color of shadow
                        spreadRadius: 0.5,
                        //spread radius
                        offset:
                        Offset(0, 0), // changes position of shadow
                        //first paramerter of offset is left-right
                        //second parameter is top to down
                      ),
                      //you can set more BoxShadow() here
                    ],
                    color: Colors.white),
                height: 90,
                width: width * .36,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children:<Widget> [

                    SizedBox(height: height * 0.003,),
                    Container(
                        padding: EdgeInsets.only(left: 5),
                        alignment: Alignment.topLeft,
                        child: Text(controller.mostSelling[index].name,style: TextStyle(fontSize: 17),)),

                    Container(
                        padding: EdgeInsets.only(left: 5),
                        alignment: Alignment.topLeft,
                        child: Text(controller.mostSelling[index].description,style: TextStyle(fontSize: 13, color: Colors.grey),)),

                    Container(
                        padding: EdgeInsets.only(left: 5, top: 5),
                        alignment: Alignment.topLeft,
                        child: Text('${controller.mostSelling[index].price} EGP',style: TextStyle(fontSize: 17, color: kPrimaryColor),)),


                  ],

                ),
              ),
              // ),

            ]);
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
    ),
      );
  }
}

class ListViewCategories extends StatelessWidget {
   ListViewCategories({
    Key key,


  }) : super(key: key);



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
    return GetBuilder<HomeViewModel>(
      builder:(controller) => Container(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return

              Column(children: <Widget>[
              InkWell(
                onTap: (){
                  print('categories');
                  Get.to(CatView(model:controller.categories[index] ,));
                },
                child: Container(
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
                  child: Padding(
                      padding: EdgeInsets.all(1),
                      child:(controller.categories[index].pic == null) ? Image.asset(imgs[index]) : Image.network(controller.categories[index].pic) ) ,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Text(controller.categories[index].name)
            ]);
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 20,
          ),
        ),
      ),
    );
  }
}

class textFormField extends StatelessWidget {
  const textFormField({
    Key key,
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
