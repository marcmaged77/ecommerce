import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:souq/core/view_model/home_view_model.dart';
import 'package:souq/view/categories/category_view.dart';

class ExploreView extends GetWidget<HomeViewModel>{
  const ExploreView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;

    return Scaffold(

      appBar: AppBar(
        centerTitle: true,
backgroundColor: Colors.transparent,
elevation: 0,
        title: Text("Explore",style: TextStyle(color: Colors.black, fontFamily: 'second'),),
      ),
      body: Container(
        padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              SizedBox(height: 20,),
              Container(
                decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/logo/Promo.png'), fit: BoxFit.cover, ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.5),
                        //color of shadow
                        spreadRadius: 0.3,
                        //spread radius
                        offset:
                        Offset(0.0, 0.0), // changes position of shadow
                        //first paramerter of offset is left-right
                        //second parameter is top to down
                      ),
                      //you can set more BoxShadow() here
                    ],
                    borderRadius: BorderRadius.circular(10),
                    color: Colors.white),
                height: 200,
                width: MediaQuery.of(context).size.width,
              ),
              SizedBox(height: 40,),
              Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Top Tech Brands",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'first'),
                  )),
              SizedBox(height: 20,),

              ListViewExplore(),


              Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Explore",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'first'),
                  )),
              SizedBox(height: 20,),

              Container(
                height: 200,
                child: Card(
                  elevation: 1,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Swiper(
                    itemCount: controller
                        .categories[2].subCategory[0].products.length,
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
                                      .categories[2]
                                      .subCategory[0]
                                      .products[index]
                                      .pic),
                                  fit: BoxFit.contain,
                                )),
                          ),
                          // Positioned(
                          //   child: Image.asset(
                          //     'assets/logo/zara-logo.png',
                          //     height: 50,
                          //     width: 50,
                          //   ),
                          // ),
                          Positioned(
                              right: 40,
                              bottom: 10,
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
                                            .categories[2]
                                            .subCategory[0]
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
                                      ),
                                  child: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          4, 3, 3, 3),
                                      child: Text(
                                        '',
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
              SizedBox(height: 20,),

              Container(
                height: 200,
                child: Card(
                  elevation: 1,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Swiper(
                    itemCount: controller
                        .categories[2].subCategory[1].products.length,
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
                                      .categories[2]
                                      .subCategory[1]
                                      .products[index]
                                      .pic),
                                  fit: BoxFit.contain,
                                )),
                          ),
                          // Positioned(
                          //   child: Image.asset(
                          //     'assets/logo/zara-logo.png',
                          //     height: 50,
                          //     width: 50,
                          //   ),
                          // ),
                          Positioned(
                              right: 40,
                              bottom: 10,
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
                                            .categories[2]
                                            .subCategory[0]
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
                                  ),
                                  child: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          4, 3, 3, 3),
                                      child: Text(
                                        '',
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
              SizedBox(height: 30,),
              Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    "Women Accessories",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        fontFamily: 'first'),
                  )),
              SizedBox(height: 20,),

              Container(
                height: 400,
                child: Card(
                  elevation: 1,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20)),
                  child: Swiper(
                    itemCount: controller
                        .categories[1].subCategory[1].products.length,
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
                                      .subCategory[1]
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
                              bottom: 10,
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
                                            .subCategory[1]
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
                              top: 50,
                              child: Container(
                                  decoration: BoxDecoration(
                      color: Colors.black,
                                    borderRadius:

                                    BorderRadius.circular(7),
                                  ),
                                  child: Container(
                                      margin: EdgeInsets.fromLTRB(
                                          4, 3, 3, 3),
                                      child: Text(
                                        'introducing',
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


              SizedBox(height: 1000,)
              // Card(
              //   elevation: 2,
              //   margin: EdgeInsets.only(right: 10),
              //   shape: RoundedRectangleBorder(
              //       borderRadius: BorderRadius.circular(7)),
              //   child: Padding(
              //     padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
              //     child: Column(
              //       children: [
              //
              //         Container(
              //           width: 140,
              //             height: 150,
              //           alignment: Alignment.topRight,
              //           padding: EdgeInsets.only(top: 12,right: 12),
              //           decoration: BoxDecoration(
              //             borderRadius: BorderRadius.circular(3),
              //             image: DecorationImage(
              //               image: AssetImage('assets/avatar/marc.jpg'),
              //               fit: BoxFit.cover
              //             )
              //           ),
              //
              //         )
              //
              //
              //       ],
              //     ),
              //   ),
              // )
            ],
          ),
        ),
      ),
    );
  }
}
class ListViewExplore extends StatelessWidget {
  ListViewExplore({
    Key key,
  }) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeViewModel>(
      builder: (controller) => Container(
        height: 100,
        child: ListView.separated(
          scrollDirection: Axis.horizontal,
          itemCount: controller.explore.length,
          itemBuilder: (context, index) {
            return Column(children: <Widget>[
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
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
                    color: Colors.white),
                height: 60,
                width: 150,
                child: Padding(
                    padding: EdgeInsets.all(1),
                    child:ListTile(
                      onTap: (){},
leading: Image.network(controller.explore[index].pic, fit: BoxFit.cover,),
                      title: Text(controller.explore[index].name, style: TextStyle(fontSize: 17, fontFamily: 'second', fontWeight: FontWeight.bold),),

                    )),
              ),
              // SizedBox(
              //   height: 10,
              // ),
              // Text(controller.categories[index].name)
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
