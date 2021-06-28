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
    return Scaffold(
      backgroundColor: Color(0xffFDFAF6),
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
        child: Container(
          child: Column(
            children: [
Container(

  alignment: Alignment.topLeft,
  child: Text(''),),
              Container(
                  padding: EdgeInsets.only(left: 6, right: 6),
                  child: ListViewProducts())

            ],
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
          height: MediaQuery.of(context).size.height,
          child: ListView.separated(
            scrollDirection: Axis.vertical,
            itemCount: controller.productModel.length,
            itemBuilder: (context, index) {
              return Row(
                children:[ Column(children: <Widget>[
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
                        Get.to(DetailScreen(model: controller.productModel[index],));

                      },
                      child: Stack(
                          fit: StackFit.passthrough,
                          children:[

                            Container(


                              child:  (controller.productModel[index].pic == null)
                                  ? Image.asset('assets/homeview/product2.png',width: 250,)

                                  : Image.network(controller.productModel[index].pic,fit: BoxFit.cover,height: 170, width: 200,
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

                            //   Container(
                            //     child: Column(
                            //     children:<Widget> [
                            //
                            //       // Padding(
                            //       //   padding: EdgeInsets.all(3),
                            //       //   child: Container(
                            //       //
                            //       //       child:  (controller.productModel[index].pic == null)
                            //       //           ? Image.asset('assets/homeview/product2.png',width: 250,)
                            //       //
                            //       //           : Image.network(controller.productModel[index].pic,fit: BoxFit.cover,height: 170,
                            //       //         loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                            //       //           if (loadingProgress == null) return child;
                            //       //           return Center(
                            //       //             child: CircularProgressIndicator(
                            //       //               value: loadingProgress.expectedTotalBytes != null ?
                            //       //               loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                            //       //                   : null,
                            //       //             ),
                            //       //           );
                            //       //         },
                            //       //       ),
                            //       //   ),
                            //       // ),
                            //
                            //       // Padding(
                            //       //   padding: EdgeInsets.all(10),
                            //       //   child: Container(
                            //       //
                            //       //    child:  (controller.productModel[index].pic == null)
                            //       //        ? Image.asset('assets/homeview/product2.png',width: 250,)
                            //       //        : Image.network(controller.productModel[index].pic,fit: BoxFit.cover,height: 150,)
                            //       //   ),
                            //       // ),
                            //       SizedBox(height: height * 0.003,),
                            //       Container(
                            //         padding: EdgeInsets.only(left: 5),
                            //           alignment: Alignment.topLeft,
                            //           child: Text(controller.productModel[index].name,style: TextStyle(fontSize: 17),)),
                            //
                            //       Container(
                            //           padding: EdgeInsets.only(left: 5),
                            //           alignment: Alignment.topLeft,
                            //           child: Text(controller.productModel[index].description,style: TextStyle(fontSize: 13, color: Colors.grey),)),
                            //
                            //       Container(
                            //           padding: EdgeInsets.only(left: 5, top: 10),
                            //           alignment: Alignment.topLeft,
                            //           child: Text('${controller.productModel[index].price} EGP',style: TextStyle(fontSize: 17, color: kPrimaryColor),)),
                            //
                            //
                            //     ],
                            //
                            // ),
                            //   ),
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

                        // Padding(
                        //   padding: EdgeInsets.all(3),
                        //   child: Container(
                        //
                        //       child:  (controller.productModel[index].pic == null)
                        //           ? Image.asset('assets/homeview/product2.png',width: 250,)
                        //
                        //           : Image.network(controller.productModel[index].pic,fit: BoxFit.cover,height: 170,
                        //         loadingBuilder:(BuildContext context, Widget child,ImageChunkEvent loadingProgress) {
                        //           if (loadingProgress == null) return child;
                        //           return Center(
                        //             child: CircularProgressIndicator(
                        //               value: loadingProgress.expectedTotalBytes != null ?
                        //               loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes
                        //                   : null,
                        //             ),
                        //           );
                        //         },
                        //       ),
                        //   ),
                        // ),

                        // Padding(
                        //   padding: EdgeInsets.all(10),
                        //   child: Container(
                        //
                        //    child:  (controller.productModel[index].pic == null)
                        //        ? Image.asset('assets/homeview/product2.png',width: 250,)
                        //        : Image.network(controller.productModel[index].pic,fit: BoxFit.cover,height: 150,)
                        //   ),
                        // ),
                        SizedBox(height: height * 0.003,),
                        Container(
                            padding: EdgeInsets.only(left: 5),
                            alignment: Alignment.topLeft,
                            child: Text(controller.productModel[index].name,style: TextStyle(fontSize: 17),)),

                        Container(
                            padding: EdgeInsets.only(left: 5),
                            alignment: Alignment.topLeft,
                            child: Text(controller.productModel[index].description,style: TextStyle(fontSize: 13, color: Colors.grey),)),

                        Container(
                            padding: EdgeInsets.only(left: 5, top: 5),
                            alignment: Alignment.topLeft,
                            child: Text('${controller.productModel[index].price} EGP',style: TextStyle(fontSize: 17, color: kPrimaryColor),)),


                      ],

                    ),
                  ),
                  // ),

                ]),
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