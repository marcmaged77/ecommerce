import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:souq/constants.dart';
import 'package:souq/core/view_model/auth_view_model.dart';
import 'package:souq/main.dart';
import 'package:souq/view/Auth/LoginPage/loginScreen.dart';
import 'package:souq/view/control_view.dart';
import 'package:souq/view/widgets/cards/card.dart';


class profileView extends GetWidget<AuthViewModel> {

  String name;
  String email;
  String pic;

  profileView({Key key,
  this.name,
    this.email,
    this.pic

  }) : super(key: key);

  @override
  Widget build(BuildContext context) {

    Size size = MediaQuery.of(context).size;


    var height = size.height;
    var width = size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text('Account', style: TextStyle(color: Colors.black, fontFamily: 'second'),),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(left: width * 0.06, right: width* 0.06),

          child: Column(

              children:[


                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [

                    // ImageContainer(pic: pic),
                    ImageContainer(pic: pic,),
                    NameEmailContainer(name: name, email: email),



                  ],
                ),
SizedBox(height: 20,),
                //
           ListTile(
             onTap: (){},

             leading: Image.asset('assets/profileView/Icon_Edit-Profile.png'),
             title: Text('Edit Profile',style: TextStyle(fontSize: 18, fontFamily: "second"),),
             trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 17,),

           ),
                SizedBox(height: 10,),
                ListTile(
                  onTap: (){},
                  leading: Image.asset('assets/profileView/Icon_Location.png'),
                  title: Text('Shipping Address',style: TextStyle(fontSize: 18, fontFamily: "second"),),
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 17,),

                ),
                SizedBox(height: 10,),


                ListTile(
                  onTap: (){},

                  leading: Image.asset('assets/profileView/Icon_Wishlist.png'),
                  title: Text('WishList',style: TextStyle(fontSize: 18, fontFamily: "second"),),
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 17,),

                ),
                SizedBox(height: 10,),
                ListTile(
                  onTap: (){},

                  leading: Image.asset('assets/profileView/Icon_History.png'),
                  title: Text('Order History',style: TextStyle(fontSize: 18, fontFamily: "second"),),
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 17,),

                ),
                SizedBox(height: 10,),

                ListTile(
                  onTap: (){},

                  leading: Image.asset('assets/profileView/Icon_Order.png'),
                  title: Text('Track Order',style: TextStyle(fontSize: 18, fontFamily: "second"),),
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 17,),

                ),
                SizedBox(height: 10,),
                ListTile(
                  onTap: (){
                    Get.to(CreditCard());

                  },

                  leading: Image.asset('assets/profileView/Icon_Payment.png'),
                  title: Text('Cards',style: TextStyle(fontSize: 18, fontFamily: "second"),),
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 17,),

                ),
                SizedBox(height: 10,),

                ListTile(
                  onTap: (){},

                  leading: Image.asset('assets/profileView/Icon_Edit-Profile.png'),
                  title: Text('Notification',style: TextStyle(fontSize: 18, fontFamily: "second"),),
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.black,size: 17,),

                ),
                SizedBox(height: 10,),
                ListTile(
                  onTap: (){

                    controller.signOutGoogle();
                    controller.signOut();
                    controller.signOutFacebook();


                  },

                  leading: Image.asset('assets/profileView/Icon_Exit.png'),
                  title: Text('Log Out',style: TextStyle(fontSize: 18, fontFamily: "second"),),
                  trailing: Icon(Icons.arrow_forward_ios,color: Colors.red,size: 17,),

                ),




                SizedBox(height: 100,),


              ]),



        ),
      ),
    );
  }
}

class NameEmailContainer extends StatelessWidget {
  const NameEmailContainer({
    Key key,
    @required this.name,
    @required this.email,
  }) : super(key: key);

  final String name;
  final String email;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topLeft,
      child: Column(
crossAxisAlignment: CrossAxisAlignment.start,
          children: [

        (name != null ? Text(name,style: TextStyle(fontSize: 18, fontFamily: "third", fontWeight: FontWeight.bold),) : ( email != null ? Text(email)  : Text('Cannot fetch name') )    ),

        Text(email)


      ]),
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key key,
    @required this.pic,
  }) : super(key: key);

  final String pic;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 110.0,
      height: 110.0,
      decoration: new BoxDecoration(
        color: const Color(0xff7c94b6),
        image: new DecorationImage(
          image:   pic != null ? NetworkImage(pic) : AssetImage('assets/avatar/unkown.jpg'),
          fit: BoxFit.cover,
        ),
        borderRadius:  BorderRadius.all(new Radius.circular(65.0)),

      ),
    );
  }
}
