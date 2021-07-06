import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:souq/components/button.dart';
import 'package:souq/components/customTextField.dart';
import 'package:souq/constants.dart';
import 'package:souq/core/view_model/home_view_model.dart';
import 'package:souq/model/new/sub/products.dart';
import 'package:souq/view/HomeScreen/seeAll/see_all.dart';
import 'package:souq/view/categories/category_view.dart';
import 'package:souq/view/widgets/detailsView/detail_view.dart';

class homeScreen extends StatelessWidget {
  //
  String email;
  String name;
  String pic;
  int _currentIndex = 0;

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
      builder: (controller) => controller.loading.value == true
          ? Center(child: CircularProgressIndicator())
          : Scaffold(
              body: Container(
                child: SingleChildScrollView(
                  child: Container(
                    padding: EdgeInsets.only(left: 20, right: 10),
                    child: Column(
                      children: <Widget>[
                        // button(
                        //   widthP: 4,
                        //   color: Colors.black,
                        //   text: 'fetch',
                        //   radius: 2,
                        //   textColor: Colors.white,
                        //   press: () {
                        //     print(controller
                        //         .categories[1].subCategory[2].products[1].pic);
                        //   },
                        // ),
                        SizedBox(
                          height: 30,
                        ),
                        Container(
                            alignment: Alignment.topLeft,
                            child: Text(
                              "Categories",
                              style: TextStyle(
                                  fontSize: 20,
                                  fontWeight: FontWeight.w600,
                                  fontFamily: 'first'),
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
                            Text(
                              'Best Selling',
                              style: TextStyle(
                                  fontSize: 20, fontWeight: FontWeight.w600),
                            ),
                            FlatButton(
                                onPressed: () {
                                  Get.to(All());

                                  print('see all');
                                },
                                child: Text('See All',
                                    style: TextStyle(fontSize: 17))),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),

                        ListViewProducts(),
                        SizedBox(
                          height: 45,
                        ),

                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text('Top Branded',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.w600)),
                            FlatButton(
                                onPressed: () {
                                  print('see all');
                                },
                                child: Text('See All',
                                    style: TextStyle(fontSize: 17))),
                          ],
                        ),
                        SizedBox(
                          height: 40,
                        ),

                        Container(
                          height: 400,
                          child: Card(
                            elevation: 1,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child:

                                 GetBuilder<HomeViewModel>(
                                   builder:(controller) => Swiper(
                                itemCount: controller.categories[1].subCategory[2].products.length,
                                autoplay: true,
                                itemBuilder: (context, index) {
                                    return Container(
                                      margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                      child: Stack(fit: StackFit.expand, children: [
                                        Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              image: DecorationImage(
                                                colorFilter: new ColorFilter.mode(
                                                    Colors.black.withOpacity(0.8),
                                                    BlendMode.dstATop),
                                                image: NetworkImage(controller
                                                    .categories[1]
                                                    .subCategory[2]
                                                    .products[index]
                                                    .pic),
                                                fit: BoxFit.cover,
                                              )),
                                        ),
                                        Positioned(
                                          child: Image.asset(
                                            'assets/logo/zara-logo.png',
                                            height: 50,
                                            width: 50,
                                          ),
                                        ),
                                        Positioned(
                                            right: 40,
                                            bottom: 60,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(7),
                                                    color: Colors.black),
                                                child: Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        3, 0, 3, 0),
                                                    child: Text(
                                                      controller
                                                              .categories[1]
                                                              .subCategory[2]
                                                              .products[index]
                                                              .price +
                                                          ' EGP',
                                                      style: TextStyle(
                                                          fontFamily: 'second',
                                                          fontSize: 23,
                                                          color: Colors.white),
                                                    )))),
                                        Positioned(
                                            left: 10,
                                            top: 60,
                                            child: Container(
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(7),
                                                    color: Colors.black),
                                                child: Container(
                                                    margin: EdgeInsets.fromLTRB(
                                                        3, 3, 3, 3),
                                                    child: Text(
                                                      'Introducing',
                                                      style: TextStyle(
                                                          fontFamily: 'third',
                                                          fontSize: 17,
                                                          color: Colors.white),
                                                    )))),
                                      ]),
                                    );
                                },
                              ),
                                 ),


                          ),
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 400,
                          child: Card(
                            elevation: 1,
                            margin: EdgeInsets.symmetric(horizontal: 20),
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20)),
                            child: GetBuilder<HomeViewModel>(

                              builder:(controller) => Swiper(
                                itemCount: controller
                                    .categories[0].subCategory[2].products.length,
                                autoplay: true,
                                itemBuilder: (context, index) {
                                  return Container(
                                    margin: EdgeInsets.fromLTRB(0, 0, 0, 0),
                                    child: Stack(fit: StackFit.expand, children: [
                                      Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(15),
                                            image: DecorationImage(
                                              colorFilter: new ColorFilter.mode(
                                                  Colors.black.withOpacity(0.8),
                                                  BlendMode.dstATop),
                                              image: NetworkImage(controller
                                                  .categories[0]
                                                  .subCategory[2]
                                                  .products[index]
                                                  .pic),
                                              fit: BoxFit.cover,
                                            )),
                                      ),
                                      Positioned(
                                        child: Image.asset(
                                          'assets/logo/Gap-logo.png',
                                          height: 50,
                                          width: 50,
                                        ),
                                      ),
                                      Positioned(
                                          right: 40,
                                          bottom: 60,
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: Colors.black),
                                              child: Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      3, 0, 3, 0),
                                                  child: Text(
                                                    controller
                                                            .categories[1]
                                                            .subCategory[2]
                                                            .products[index]
                                                            .price +
                                                        ' EGP',
                                                    style: TextStyle(
                                                        fontFamily: 'second',
                                                        fontSize: 23,
                                                        color: Colors.white),
                                                  )))),
                                      Positioned(
                                          left: 10,
                                          top: 60,
                                          child: Container(
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(7),
                                                  color: Colors.black),
                                              child: Container(
                                                  margin: EdgeInsets.fromLTRB(
                                                      3, 3, 3, 3),
                                                  child: Text(
                                                    'Introducing',
                                                    style: TextStyle(
                                                        fontFamily: 'third',
                                                        fontSize: 17,
                                                        color: Colors.white),
                                                  )))),
                                    ]),
                                  );
                                },
                              ),
                            ),
                          ),
                        ),

                        SizedBox(
                          height: 1000,
                        )
                      ],
                    ),
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
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        //background
        height: 310,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.mostSelling.length,
          itemBuilder: (context, index) {
            return Column(children: <Widget>[
              SizedBox(
                height: 5,
              ),
              Card(
                elevation: 1,
                margin: EdgeInsets.only(right: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                child: InkWell(
                  onTap: () {
                    Get.to(DetailScreen(
                      model: controller.mostSelling[index],
                    ));
                  },
                  child: SizedBox(
                    //card nafso abyad
                    height: 300,
                    child: Column(
                      children: [
                        Container(
                          //image
                          width: 150,
                          height: 190,
                          alignment: Alignment.topRight,
                          padding: EdgeInsets.only(top: 12, right: 12),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(3),
                              image: DecorationImage(
                                  image: NetworkImage(
                                      controller.mostSelling[index].pic),
                                  fit: BoxFit.cover)),
                        ),
                        SizedBox(
                          width: 150,
                          height: 110,
                          child: Stack(
                            children:[
                              Column(children: [
                                Container(
                                    padding: EdgeInsets.only(top: 10,left: 5),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      controller.mostSelling[index].name,
                                      style: TextStyle(fontSize: 17),
                                    )),
                                Container(
                                    padding: EdgeInsets.only(left: 5),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      controller.mostSelling[index].description,
                                      style: TextStyle(
                                          fontSize: 13, color: Colors.grey),
                                    )),
                              ]),
                              Positioned(
                                bottom: 5,
                                child: Container(
                                    padding: EdgeInsets.only(left: 5, top: 5),
                                    alignment: Alignment.topLeft,
                                    child: Text(
                                      '${controller.mostSelling[index].price} EGP',
                                      style: TextStyle(
                                          fontSize: 17, color: kPrimaryColor),
                                    )),
                              ),
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
              ),

              // Container(
              //   decoration: BoxDecoration(boxShadow: [
              //     BoxShadow(
              //       color: Colors.black.withOpacity(0.1),
              //       //color of shadow
              //       spreadRadius: 0.5,
              //       //spread radius
              //       offset: Offset(0, 1), // changes position of shadow
              //       //first paramerter of offset is left-right
              //       //second parameter is top to down
              //     ),
              //     //you can set more BoxShadow() here
              //   ], color: Colors.white),
              //   height: height * .256,
              //   width: width * .36,
              //   // child: FlatButton(
              //   //   onPressed: (){
              //   //     Get.to(DetailScreen(model: controller.productModel[index],));
              //   //
              //   //   },
              //   child: InkWell(
              //     onTap: () {
              //       Get.to(DetailScreen(
              //         model: controller.mostSelling[index],
              //       ));
              //     },
              //     child: Stack(fit: StackFit.passthrough, children: [
              //       Container(
              //         child: (controller.mostSelling[index].pic == null)
              //             ? Image.asset(
              //                 'assets/homeview/product2.png',
              //                 width: 250,
              //               )
              //             : Image.network(
              //                 controller.mostSelling[index].pic,
              //                 fit: BoxFit.cover,
              //                 height: 170,
              //                 width: 200,
              //                 loadingBuilder: (BuildContext context,
              //                     Widget child,
              //                     ImageChunkEvent loadingProgress) {
              //                   if (loadingProgress == null) return child;
              //                   return Center(
              //                     child: CircularProgressIndicator(
              //                       value: loadingProgress.expectedTotalBytes !=
              //                               null
              //                           ? loadingProgress
              //                                   .cumulativeBytesLoaded /
              //                               loadingProgress.expectedTotalBytes
              //                           : null,
              //                     ),
              //                   );
              //                 },
              //               ),
              //       ),
              //     ]),
              //   ),
              // ),
              SizedBox(
                height: 3,
              ),
              // Card(
              //   shadowColor: Colors.grey.shade100,
              //   elevation: 2,
              //   child: Container(
              //     decoration: BoxDecoration(
              //     color: Colors.white),
              //     height: 95,
              //     width: width * .36,
              //     child: Container(
              //       margin: EdgeInsets.fromLTRB(0, 9, 0, 0),
              //       child: Stack(
              //         children: <Widget>[
              //           SizedBox(
              //             height: height * 0.003,
              //           ),
              //           Column(
              //             children:[ Container(
              //                 padding: EdgeInsets.only(left: 5),
              //                 alignment: Alignment.topLeft,
              //                 child: Text(
              //                   controller.mostSelling[index].name,
              //                   style: TextStyle(fontSize: 17),
              //                 )),
              //               Container(
              //                   padding: EdgeInsets.only(left: 5),
              //                   alignment: Alignment.topLeft,
              //                   child: Text(
              //                     controller.mostSelling[index].description,
              //                     style: TextStyle(fontSize: 13, color: Colors.grey),
              //                   )),
              //           ]),
              //
              //           Positioned(
              //             bottom: 7,
              //             child: Container(
              //                 padding: EdgeInsets.only(left: 5, top: 5),
              //                 alignment: Alignment.topLeft,
              //                 child: Text(
              //                   '${controller.mostSelling[index].price} EGP',
              //                   style: TextStyle(fontSize: 17, color: kPrimaryColor),
              //                 )),
              //           ),
              //         ],
              //       ),
              //     ),
              //   ),
              // ),
              // ),
            ]);
          },
          separatorBuilder: (context, index) => SizedBox(
            width: 17,
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

  final List<String> imgs = <String>[
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
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.categories.length,
          itemBuilder: (context, index) {
            return Column(children: <Widget>[
              InkWell(
                onTap: () {
                  print('categories');
                  Get.to(CatView(
                    model: controller.categories[index],
                  ));
                },
                child: Container(
                  decoration: BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.1),
                          //color of shadow
                          spreadRadius: 0.1,
                          //spread radius
                          offset: Offset(0, 001), // changes position of shadow
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
                      child: (controller.categories[index].pic == null)
                          ? Image.asset(imgs[index])
                          : Image.network(controller.categories[index].pic)),
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
