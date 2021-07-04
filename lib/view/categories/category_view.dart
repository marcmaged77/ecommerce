import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq/components/button.dart';
import 'package:souq/model/new/categoryModel.dart';
import 'package:souq/model/new/sub/subCategory.dart';
import 'package:souq/view/categories/catTypes/CatTypes_view.dart';

class CatView extends StatelessWidget {
  Category model;

  CatView({Key key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;

    return Scaffold(
      appBar: AppBar(
        toolbarHeight: height * 0.10,
        centerTitle: true,
        backgroundColor: Colors.transparent,
        elevation: 0.0,
        title: Text(
          model.name,
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'second',
            fontSize: 23
          ),
        ),
        leading: BackButton(
          color: Colors.black,
        ),


      ),

      body: Container(
          padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06),
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 10,
                ),



                Container(
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          image: NetworkImage(model.cover), fit: BoxFit.cover, ),
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
                Padding(
                  padding: EdgeInsets.only(top: 20),
                  child: SizedBox(
                      width: width,
                      child: GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),

                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10.0,
                            mainAxisSpacing: 10.0,
                          ),
                          itemCount: model.subCategory.length,
                          itemBuilder: (context, index) {
                            return InkWell(
                              onTap: () {
                                Get.to(CatTypes(model:model.subCategory[index],));

                                print(model.subCategory[index].products[0].name);
                              },
                              child: Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        image: DecorationImage(
                                          colorFilter: new ColorFilter.mode(Colors.black.withOpacity(0.6), BlendMode.dstATop),

                                          image: NetworkImage(model.subCategory[index].cover,),
                                          fit: BoxFit.cover,
                                        ),
                                        boxShadow: [
                                          BoxShadow(
                                            color:
                                                Colors.black.withOpacity(0.5),
                                            //color of shadow
                                            spreadRadius: 0.3,
                                            //spread radius
                                            offset: Offset(0.0,
                                                0.0), // changes position of shadow
                                            //first paramerter of offset is left-right
                                            //second parameter is top to down
                                          ),
                                          //you can set more BoxShadow() here
                                        ],
                                        borderRadius: BorderRadius.circular(10),
                                        // color: Colors.red
                                    ),
                                  ),
                                  Positioned(
                                    left: 10,
                                      bottom: 20,
                                      child: Text(
                                        model.subCategory[index].name,
                                        style: TextStyle(
                                            fontFamily: 'second',
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontSize: 20),
                                      ))
                                ],
                              ),
                            );
                          })),
                ),

SizedBox(height: 1000,)

              ],
            ),
          )),
    );
  }
}
