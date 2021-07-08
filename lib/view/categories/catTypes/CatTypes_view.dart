import 'package:flip_card/flip_card.dart';
import 'package:flutter/material.dart';
import 'package:souq/components/button.dart';
import 'package:souq/constants.dart';
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
          title: Text(
            model.name,
            style: TextStyle(color: Colors.black, fontFamily: 'second'),
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: BackButton(
            color: Colors.black,
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          padding: EdgeInsets.only(
            top: 20,
            left: width * 0.02,
            right: width * 0.02,
          ),
          child: Column(children: [
            SizedBox(
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10.0,
                      mainAxisSpacing: 20.0,
                      childAspectRatio:
                          width / (MediaQuery.of(context).size.height / 0.85),
                    ),
                    itemCount: model.products.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                          onTap: () {},
                          child: Card(
                            elevation: 1,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(4.0),
                            ),
                            child: Column(children: [
                              Stack(
                                  alignment: AlignmentDirectional.bottomStart,
                                  children: [
                                    Container(
                                        height: 300,
                                        decoration: BoxDecoration(
                                            image: DecorationImage(
                                                image: NetworkImage(
                                                  model.products[index].pic,
                                                ),
                                                fit: BoxFit.cover))),
                                    Container(
                                        decoration:
                                            BoxDecoration(color: Colors.red),
                                        child: Container(
                                            margin:
                                                EdgeInsets.fromLTRB(3, 3, 3, 3),
                                            child: Text(
                                              'Sale',
                                              style: TextStyle(
                                                  fontFamily: 'third',
                                                  fontSize: 17,
                                                  color: Colors.white),
                                            )))
                                  ]),
                              SizedBox(
                                height: 10,
                              ),
                              Column(
                                  children: [
                                model.products[index].name == null
                                    ? Container(
                                        alignment: Alignment.topLeft,
                                        child: Text('Product 01-290',
                                            style: TextStyle(
                                                color: Color(0xFF575E67),
                                                fontFamily: 'second',
                                                fontSize: 14.0)),
                                      )
                                    : Container(
                                        padding: EdgeInsets.only(left: 4),
                                        alignment: Alignment.topLeft,
                                        child: Text(
                                            '${model.products[index].name}',
                                            style: TextStyle(
                                              color: Color(0xFF575E67),
                                              fontFamily: 'second',
                                              fontSize: 16,
                                            )),
                                      ),
                                Column(
                                    mainAxisAlignment: MainAxisAlignment.start,

                                    children: [
                                  Container(
                                    padding: EdgeInsets.only(left: 4, top: 1),
                                    alignment: Alignment.topLeft,
                                    child: Text('Elgible for Free Shipping',
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'second',
                                          fontSize: 13,
                                        )),
                                  ),
                                  Container(
                                    padding: EdgeInsets.only(right: 80, top: 2, bottom: 4),

                                    child: Container(
                                        decoration:
                                            BoxDecoration(color: kPrimaryColor),
                                        child: Container(
                                            margin:
                                                EdgeInsets.fromLTRB(3, 3, 3, 3),
                                            child: Text(
                                              'Fullfiled by Aramex',
                                              style: TextStyle(
                                                  fontFamily: 'third',
                                                  fontSize: 10,
                                                  color: Colors.white),
                                            ))),
                                  )
                                ]),
                                Container(
                                  padding: EdgeInsets.only(
                                    left: 4,
                                  ),
                                  alignment: Alignment.topLeft,
                                  child: Text(
                                      model.products[index].price + ' EGP',
                                      style: TextStyle(
                                          color: kPrimaryColor,
                                          fontFamily: 'second',
                                          fontSize: 16)),
                                ),
                              ]),
                            ]),
                          ));
                    })),
            SizedBox(
              height: 100,
            )
          ]),
        )));
  }
}
