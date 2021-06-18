import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq/constants.dart';
import 'package:souq/core/view_model/auth_view_model.dart';
import 'package:souq/core/view_model/home_view_model.dart';
import 'package:souq/view/HomeScreen/home_screen.dart';
import 'package:souq/view/LoginPage/loginScreen.dart';
import 'package:souq/view/profileView/profile_view.dart';
import 'package:custom_navigation_bar/custom_navigation_bar.dart';
import 'cartView/cart_view.dart';



class ControlView extends StatefulWidget {
  const ControlView({Key key}) : super(key: key);
  @override
  _ControlViewState createState() => _ControlViewState();
}
class _ControlViewState extends State<ControlView> {

  int _currentIndex = 0;
  bool typing = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.grey.shade50,
          elevation: 0.0,
          title: typing ? TextBox() : Text("Title"),
          leading: IconButton(
            icon: Icon(typing ? Icons.done : Icons.search),
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
          (_currentIndex == 0 ? homeScreen() : (_currentIndex == 1 ? Cart() : profileView())),






      ),
      bottomNavigationBar:CustomNavigationBar(
        iconSize: 30.0,
        selectedColor: Color(0xff040307),
        strokeColor: Color(0x30040307),
        unSelectedColor: Color(0xffacacac),
        backgroundColor: Colors.white,
        items: [
          CustomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text("Home"),

          ),
          CustomNavigationBarItem(
            icon: Padding(
                padding: EdgeInsets.only(top: 5,left: 3),
                child: Image.asset('assets/homeview/Icon_Cart.png')),
            title: Text("Me"),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.shopping_cart),
            title: Text("Cart"),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.lightbulb_outline),
            title: Text("Explore"),
          ),
          CustomNavigationBarItem(
            icon: Icon(Icons.search),
            title: Text("Search"),
          ),

        ],
        currentIndex: _currentIndex,
        onTap: (index) {
          print(index);
          setState(() {
            _currentIndex = index;
          });
        },
      )
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


