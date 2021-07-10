import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:souq/components/button.dart';
import 'package:souq/constants.dart';
import 'package:souq/view/Auth/LoginPage/loginScreen.dart';
import 'package:get/get.dart';


class OnBoarding extends StatefulWidget {
  const OnBoarding({Key key}) : super(key: key);

  @override
  _OnBoardingState createState() => _OnBoardingState();
}

class _OnBoardingState extends State<OnBoarding> {
  int currentPage = 0;
  List<Map<String, String>> splashData = [
    {
      'text': "Welcome To Shopify, Let's Shop",
      'image': "assets/onboard/splash_1.png"
    },
    {
      'text':
          "We help people connect with top Brands \n around Egypt and the Middle East",
      'image': "assets/onboard/splash_2.png"
    },
    {
      'text': "We Show The Easy way to Shop. \n Stay Home, Stay Safe",
      'image': "assets/onboard/splash_3.png"
    }
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          child: Column(
            children: [
              Expanded(
                  flex: 4,
                  child: PageView.builder(
                    onPageChanged:(value){
                      setState(() {
                        currentPage = value;
                      });
                    },
                    itemCount: splashData.length,
                    itemBuilder: (context, index) => splashContent(
                      text: splashData[index]['text'],
                      image: splashData[index]['image'],
                    ),
                  )),
              Expanded(
                  flex: 2,
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,

                        children:
                        List.generate(splashData.length, (index) =>
                            Dot(index: index),
                        ),

                      ),
                      SizedBox(
                        height: 30,
                      ),
                      Container(
                        width: 300,
                        child: button(
                          widthP: 4,
                          color: kPrimaryColor,
                          press: (){
                            Navigator.of(context).push(new SecondPageRoute());
                          },
                          radius: 7,
                          text: "Continue",
                          textColor: Colors.white,

                        ),
                      )
                    ],
                  ),)
            ],
          ),
        ),
      ),
    );
  }

  AnimatedContainer Dot({int index}) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 200),
                        margin: EdgeInsets.only(right: 5),
                        height: 6,
                        width: currentPage == index ? 20 : 6,
                        decoration: BoxDecoration(
                          color: currentPage == index ? kPrimaryColor : Colors.grey,
                          borderRadius: BorderRadius.circular(7),
                        ),
                      );
  }
}





class splashContent extends StatelessWidget {
  splashContent({Key key, this.text, this.image})
      : super(
          key: key,
        );
  final String text, image;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Spacer(
          flex: 4,
        ),
        Text(
          'SHOPIFY',
          style: TextStyle(
              fontSize: 30,
              fontFamily: 'third',
              color: kPrimaryColor,
              fontWeight: FontWeight.bold,
              letterSpacing: 3),
        ),
        SizedBox(height: 10),
        Text(
          text,
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            fontFamily: 'second',
            color: Colors.grey,
          ),
        ),
        Spacer(flex: 1),
        Image.asset(
          image,
          height: 300,
          width: 235,
        )
      ],
    );
  }
}
class SecondPageRoute extends CupertinoPageRoute {
  SecondPageRoute()
      : super(builder: (BuildContext context) => new LoginScreen());


  // OPTIONAL IF YOU WISH TO HAVE SOME EXTRA ANIMATION WHILE ROUTING
  @override
  Widget buildPage(BuildContext context, Animation<double> animation,
      Animation<double> secondaryAnimation) {
    return new FadeTransition(opacity: animation, child: new LoginScreen());
  }
}