import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:souq/core/view_model/home_view_model.dart';
import 'package:get/get.dart';
import 'package:souq/view/widgets/detailsView/detail_view.dart';

import '../../../constants.dart';


class All extends StatelessWidget {
  const All({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;

    return Scaffold(
      appBar: AppBar(
        title: Text('Best Selling',style: TextStyle(color: Colors.black, fontFamily: 'second', fontSize: 23),),
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        leading: BackButton(
          color: Colors.black,
        ),

      ),
      body:SingleChildScrollView(
        child: Column(children: [
          ListViewProducts()
        ] ),
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
      builder: (controller) =>

          Container(
            height: height,
        //background
        child: GridView.builder(
          shrinkWrap: true,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate:
          SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 130.0,
          ),

          itemCount: controller.mostSelling.length,
          itemBuilder: (context, index) {
            return Column(children: <Widget>[

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
                          width: 170,
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
                                      padding: EdgeInsets.only(top: 20,left: 5),
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
          // separatorBuilder: (context, index) => SizedBox(
          //   width: 17,
          // ),
        ),
      ),
    );
  }
}
