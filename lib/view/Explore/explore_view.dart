import 'package:flutter/material.dart';

class ExploreView extends StatelessWidget {
  const ExploreView({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var width = size.width;
    var height = size.height;

    return Scaffold(
      body: Container(
        padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                elevation: 2,
                margin: EdgeInsets.only(right: 10),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(7)),
                child: Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 100),
                  child: Column(
                    children: [


                      Container(
                        width: 140,
                          height: 150,
                        alignment: Alignment.topRight,
                        padding: EdgeInsets.only(top: 12,right: 12),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          image: DecorationImage(
                            image: AssetImage('assets/avatar/marc.jpg'),
                            fit: BoxFit.cover
                          )
                        ),

                      )


                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
