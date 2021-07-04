import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq/constants.dart';
import 'package:souq/core/view_model/auth_view_model.dart';
import 'package:souq/core/view_model/home_view_model.dart';
import 'package:souq/view/Explore/explore_view.dart';
import 'package:souq/view/HomeScreen/home_screen.dart';
import 'package:souq/view/Auth/LoginPage/loginScreen.dart';
import 'package:souq/view/profileView/profile_view.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'cartView/cart_view.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';



class ControlView extends StatefulWidget {

  String name;
  String email;
  String pic;


  ControlView({Key key,
  this.name,
    this.email,
    this.pic
  }) : super(key: key);
  @override
  _ControlViewState createState() => _ControlViewState();
}
class _ControlViewState extends State<ControlView> {


  @override
  void initState() {
    super.initState();
    Get.put(HomeViewModel());


  }



  int _currentIndex = 0;
  PageController _pageController;
  bool typing = false;



  @override
  Widget build(BuildContext context) {


    Size size = MediaQuery.of(context).size;

    var height = size.height;
    var width = size.width;
    return Scaffold(
        extendBody: true,
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          elevation: 0.0,
          title:(

              _currentIndex == 1  ? Container() :
                                                   typing ? TextBox() : Text("", style: TextStyle(color: Colors.white),)


          ),


          leading: _currentIndex == 1  ? Container() : IconButton(
            icon:
            Icon(typing ? Icons.done : Icons.search),
            onPressed: () {
              setState(() {
                typing = !typing;
              });
            },
            color: Colors.black,
          ),
        ),
      body:Container(
        child:



          (_currentIndex == 0 ? homeScreen() : _currentIndex == 1 ? ExploreView() : _currentIndex == 2 ? Cart() :  _currentIndex == 4 ? profileView(name: widget.name, email: widget.email, pic: widget.pic,) : Cart()),






      ),
      bottomNavigationBar:
      BottomNavyBar(
        containerHeight: 50,
        selectedIndex: _currentIndex,
        showElevation: true, // use this to remove appBar's elevation
        onItemSelected: (index) => setState(() {
          _currentIndex = index;
          // _pageController.animateToPage(index,
          //     duration: Duration(milliseconds: 300), curve: Curves.ease);
        }),
        items: [
          BottomNavyBarItem(
            icon: Icon(Icons.apps),
            title: Text('Home'),
            activeColor: kPrimaryColor2,
              inactiveColor: Colors.black
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.explore),
              title: Text('Explore'),
              activeColor: kPrimaryColor2,
            inactiveColor: Colors.black

          ),
          BottomNavyBarItem(
              icon: Icon(Icons.shopping_cart),
              title: Text('Cart'),

              activeColor: kPrimaryColor2,
              inactiveColor: Colors.black
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.search),
              title: Text('Search'),
              activeColor: kPrimaryColor2,
              inactiveColor: Colors.black
          ),
          BottomNavyBarItem(
              icon: Icon(Icons.account_circle),
              title: Text('Account'),
              activeColor: kPrimaryColor2,
              inactiveColor: Colors.black
          ),
        ],
      )


      // Container(
      //   padding: EdgeInsets.only(left: 17, right: 17, bottom: 18, top: 10),
      //
      //   child: Container(
      //     decoration:  BoxDecoration(boxShadow: [
      //       BoxShadow(
      //         color: Colors.grey.withOpacity(1),
      //         //color of shadow
      //         spreadRadius: 0.1,
      //         //spread radius
      //         offset: Offset(0.2, 0.2), // changes position of shadow
      //         //first paramerter of offset is left-right
      //         //second parameter is top to down
      //       ),
      //       //you can set more BoxShadow() here
      //     ],
      //         borderRadius: BorderRadius.only(
      //             topRight: Radius.circular(20),
      //             // bottomLeft: Radius.circular(30),
      //             // bottomRight: Radius.circular(30),
      //             topLeft: Radius.circular(20)),
      //     ),
      //     child: ClipRRect(
      //       borderRadius: BorderRadius.only(
      //         topRight: Radius.circular(20),
      //         topLeft: Radius.circular(20),
      //         // bottomLeft: Radius.circular(30),
      //         // bottomRight: Radius.circular(30)
      //
      //       ),
      //       child: CustomNavigationBar(
      //
      //         iconSize: 30.0,
      //         selectedColor: kPrimaryColor,
      //         strokeColor: Color(0x30040307),
      //         unSelectedColor: Color(0xffacacac),
      //         backgroundColor: Colors.white,
      //         items: [
      //           CustomNavigationBarItem(
      //             icon: Icon(Icons.cottage, size: 30,),
      //             title: Text("Home", style: TextStyle(fontFamily: 'second'),),
      //
      //           ),
      //
      //           CustomNavigationBarItem(
      //             icon: Icon(Icons.lightbulb_outline),
      //             title: Text("Explore", style: TextStyle(fontFamily: 'second'),),
      //           ),
      //
      //           CustomNavigationBarItem(
      //             icon: Icon(Icons.shopping_cart),
      //             title: Text("Cart", style: TextStyle(fontFamily: 'second'),),
      //           ),
      //           CustomNavigationBarItem(
      //             icon: Icon(Icons.search),
      //             title: Text("Search", style: TextStyle(fontFamily: 'second'),),
      //           ),
      //
      //           CustomNavigationBarItem(
      //             icon: Icon(Icons.account_circle),
      //             title: Text("Me", style: TextStyle(fontFamily: 'second'),),
      //           ),
      //
      //         ],
      //         currentIndex: _currentIndex,
      //         onTap: (index) {
      //           print(index);
      //           setState(() {
      //             _currentIndex = index;
      //           });
      //
      //         },
      //
      //       ),
      //     ),
      //   ),
      //
      // )
    );
  }



}

class TextBox extends StatelessWidget {
  const TextBox({
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



// class ControlView extends StatefulWidget {
//   const ControlView({Key? key}) : super(key: key);
//
//   @override
//   _ControlViewState createState() => _ControlViewState();
// }
//
// class _ControlViewState extends State<ControlView> {
//   int _index = 0;
//
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // bottomNavigationBar: BottomNavigationBar(
//       //
//       //
//       //
//       //
//       //
//       //   items: [
//       //
//       //     BottomNavigationBarItem(
//       //
//       //       // activeIcon:Text("Explore") ,
//       //
//       //
//       //
//       //         label: '',
//       //
//       //         icon: Padding(
//       //           padding: EdgeInsets.only(top: 10),
//       //
//       //           child: Image.asset('assets/homeview/Explore.png',fit: BoxFit.contain,
//       //
//       //             width: 35,),
//       //         )),
//       //
//       //
//       //
//       //     BottomNavigationBarItem(
//       //
//       //         activeIcon:Text("Cart") ,
//       //
//       //
//       //
//       //         label: '',
//       //
//       //
//       //
//       //         icon: Padding(
//       //           padding: EdgeInsets.only(top: 10),
//       //
//       //           child: Image.asset('assets/homeview/Icon_Cart.png',fit: BoxFit.contain,
//       //
//       //             width: 20,),
//       //         )),
//       //
//       //
//       //
//       //     BottomNavigationBarItem(
//       //
//       //         activeIcon:Text("Account") ,
//       //
//       //
//       //
//       //         label: '',
//       //
//       //
//       //
//       //         icon: Padding(
//       //           padding: EdgeInsets.only(top: 10),
//       //           child: Image.asset('assets/homeview/Icon_User.png',fit: BoxFit.contain,
//       //
//       //             width: 20,),
//       //         )),
//       //
//       //   ],
//       //
//       //
//       //  onTap: (_index){
//       //    print(_index);
//       //
//       //    if(_index == 0){
//       //      print('home');
//       //
//       //      setState(() {
//       //        _index = 0;
//       //
//       //      });
//       //
//       //    }else if(_index == 1){
//       //      print('cart');
//       //
//       //      setState(() {
//       //        _index = 1;
//       //
//       //      });
//       //    }else {
//       //      print('profile');
//       //      setState(() {
//       //        _index = 2;
//       //
//       //      });
//       //    }
//       //
//       //
//       //  },
//       //   selectedItemColor: Colors.black,
//       //   backgroundColor: Colors.grey.shade50,
//       //
//       // ),
// bottomNavigationBar:           bottomNavigationBar()
//         ,
//       body: Container(
//         child:Center(
//           child: Column(
//             children: [
//
//
// Text('hello'),
//             ],
//
//           ),
//         )
//       )
//
//
//
//
//
//     );
//   }
//
//
//
//   Widget? bottomNavigationBar() {
//
//
//           BottomNavigationBar(
//
//
//
//
//
//             items: [
//
//               BottomNavigationBarItem(
//
//                 // activeIcon:Text("Explore") ,
//
//
//
//                   label: '',
//
//                   icon: Padding(
//                     padding: EdgeInsets.only(top: 10),
//
//                     child: Image.asset('assets/homeview/Explore.png',fit: BoxFit.contain,
//
//                       width: 35,),
//                   )),
//
//
//
//               BottomNavigationBarItem(
//
//                   activeIcon:Text("Cart") ,
//
//
//
//                   label: '',
//
//
//
//                   icon: Padding(
//                     padding: EdgeInsets.only(top: 10),
//
//                     child: Image.asset('assets/homeview/Icon_Cart.png',fit: BoxFit.contain,
//
//                       width: 20,),
//                   )),
//
//
//
//               BottomNavigationBarItem(
//
//                   activeIcon:Text("Account") ,
//
//
//
//                   label: '',
//
//
//
//                   icon: Padding(
//                     padding: EdgeInsets.only(top: 10),
//                     child: Image.asset('assets/homeview/Icon_User.png',fit: BoxFit.contain,
//
//                       width: 20,),
//                   )),
//
//             ],
//
//             currentIndex: _index,
//
//             onTap: (_index){
//               print(_index);
//
//             },
//             selectedItemColor: Colors.black,
//             backgroundColor: Colors.grey.shade50,
//
//           );
//
//
//   }
//
//   @override
//   Widget Home1(BuildContext context){
//     return  homeScreen();
//   }
//
//   @override
//   Widget course(BuildContext context){
//     return Cart();
//
//   }
//   @override
//   Widget Profile1(BuildContext context){
//     return profileView();
//   }
//
//
// }
//


// class ControlView extends GetWidget<AuthViewModel> {
//
//
//   @override
//   Widget build(BuildContext context) {
//
//
//     return Obx( (){
//
//       return (Get.find<AuthViewModel>().name != null)
//
//           ? GetBuilder<HomeViewModel>(
//             builder:(controller)=>  Scaffold(
//             bottomNavigationBar: bottomNavigationBar(),
//
//             body: controller.currentScreen),
//           )
//            : LoginScreen();
//
//
//
//     });
//
//   }
//
//
//
//   bottomNavigationBar() {
//
//     return GetBuilder<HomeViewModel>(
//       init: HomeViewModel(),
//       builder: (controller) =>
//           BottomNavigationBar(
//
//
//
//
//
//             items: [
//
//               BottomNavigationBarItem(
//
//                 // activeIcon:Text("Explore") ,
//
//
//
//                   label: '',
//
//                   icon: Padding(
//                     padding: EdgeInsets.only(top: 10),
//
//                     child: Image.asset('assets/homeview/Explore.png',fit: BoxFit.contain,
//
//                       width: 35,),
//                   )),
//
//
//
//               BottomNavigationBarItem(
//
//                   activeIcon:Text("Cart") ,
//
//
//
//                   label: '',
//
//
//
//                   icon: Padding(
//                     padding: EdgeInsets.only(top: 10),
//
//                     child: Image.asset('assets/homeview/Icon_Cart.png',fit: BoxFit.contain,
//
//                       width: 20,),
//                   )),
//
//
//
//               BottomNavigationBarItem(
//
//                   activeIcon:Text("Account") ,
//
//
//
//                   label: '',
//
//
//
//                   icon: Padding(
//                     padding: EdgeInsets.only(top: 10),
//                     child: Image.asset('assets/homeview/Icon_User.png',fit: BoxFit.contain,
//
//                       width: 20,),
//                   )),
//
//             ],
//
//             currentIndex: controller.NavigatorValue,
//
//             onTap: (index){
//               controller.changeSelectedValue(index);
//
//
//               print(index);
//         },
//             selectedItemColor: Colors.black,
//             backgroundColor: Colors.grey.shade50,
//
//           ),
//     );
//
//   }
//
//
//
// }


