import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:souq/components/button.dart';
import 'package:souq/model/new/categoryModel.dart';
import 'package:souq/model/new/sub/products.dart';
import 'package:souq/model/new/sub/subCategory.dart';

class CatTypes extends StatelessWidget {
  Category model;

  CatTypes({Key key, this.model}) : super(key: key);


  GlobalKey<FlipCardState> cardKey = GlobalKey<FlipCardState>();


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    var height = size.height;
    var width = size.width;
    return Scaffold(
      appBar: AppBar(
        leading: BackButton(
          color: Colors.black,
        ),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding:
              EdgeInsets.only(top: 200, left: width * 0.06, right: width * 0.06),
          child: Column(children: [
            button(
              widthP: 4,
              text: 'fetch',
              textColor: Colors.white,
              color: Colors.black,
              press: () {
                print(model.products[1].price);
              },
            ),


            SizedBox(
                height: 500,
                width: width,
                child: GridView.builder(
                    gridDelegate:
                    SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 1,
                    ),
                    itemCount: model.products.length,
                    itemBuilder: (context, index) {
                      return
                        FlatButton(
                          child: FlipCard(
                            key: cardKey,
                            // flipOnTouch: false,
                            front: Container(
                              child: InkWell(
                                onLongPress: () => cardKey.currentState.toggleCard(),
                                child: Image.network(model.products[index].pic, fit: BoxFit.cover,),
                              ),
                            ),
                            back: Container(
                              child:  FlatButton(
                                onLongPress: () => cardKey.currentState.toggleCard(),
                                child: Text(model.products[index].description),
                              ),
                            ),
                          ),
                        );


                      //   InkWell(
                      //   onTap: () {
                      //
                      //     print(model.subCategory[index].products[0].name);
                      //   },
                      //   child: Stack(
                      //     children: [
                      //       Container(
                      //         decoration: BoxDecoration(
                      //             image: DecorationImage(
                      //               image: NetworkImage(model.products[index].pic,),
                      //               fit: BoxFit.cover,
                      //             ),
                      //             boxShadow: [
                      //               BoxShadow(
                      //                 color:
                      //                 Colors.black.withOpacity(0.5),
                      //                 //color of shadow
                      //                 spreadRadius: 0.3,
                      //                 //spread radius
                      //                 offset: Offset(0.0,
                      //                     0.0), // changes position of shadow
                      //                 //first paramerter of offset is left-right
                      //                 //second parameter is top to down
                      //               ),
                      //               //you can set more BoxShadow() here
                      //             ],
                      //             borderRadius: BorderRadius.circular(10),
                      //             color: Colors.red),
                      //       ),
                      //       Positioned(
                      //           left: 10,
                      //           bottom: 20,
                      //           child: Text(
                      //             model.products[index].name,
                      //             style: TextStyle(
                      //                 fontFamily: 'second',
                      //                 color: Colors.white,
                      //                 fontWeight: FontWeight.bold,
                      //                 fontSize: 20),
                      //           ))
                      //     ],
                      //   ),
                      // );
                    })),








          ]),
        ),
      ),
    );
  }
}
