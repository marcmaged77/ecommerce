import 'package:flutter/material.dart';
import 'package:credit_card_type_detector/credit_card_type_detector.dart';
import 'package:souq/components/button.dart';
import 'package:souq/constants.dart';
// class CreditCard extends StatefulWidget {
//   const CreditCard({Key key}) : super(key: key);
//
//   @override
//   _CreditCardState createState() => _CreditCardState();
// }
//
// class _CreditCardState extends State<CreditCard> {
//   @override
//   Widget build(BuildContext context) {
//     Size size = MediaQuery.of(context).size;
//
//     var height = size.height;
//     var width = size.width;
//
//
//     final GlobalKey<FormState> _formKey = GlobalKey();
//
//
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: Text(
//           'Credit Cards',
//           style: TextStyle(fontFamily: 'second', color: Colors.black),
//         ),
//         leading: BackButton(
//           color: Colors.black,
//         ),
//         backgroundColor: Colors.transparent,
//         elevation: 0.0,
//       ),
//       extendBody: true,
//       body: Container(
//         padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06),
//         child: Container(
//           child: SingleChildScrollView(
//             child: Column(
//               children: [
//                 CreditCardForm(
//                   formKey: _formKey, // Required
//                   onCreditCardModelChange: (CreditCardModel data) {}, // Required
//                   themeColor: Colors.red,
//                   obscureCvv: true,
//                   obscureNumber: true,
//                   cardNumberDecoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Number',
//                     hintText: 'XXXX XXXX XXXX XXXX',
//                   ),
//                   expiryDateDecoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Expired Date',
//                     hintText: 'XX/XX',
//                   ),
//                   cvvCodeDecoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'CVV',
//                     hintText: 'XXX',
//                   ),
//                   cardHolderDecoration: const InputDecoration(
//                     border: OutlineInputBorder(),
//                     labelText: 'Card Holder',
//                   ),
//                 ),
//
//                 Text(" creditcard")
//
//
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }



class CreditCard extends StatelessWidget {
  const CreditCard({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

        Size size = MediaQuery.of(context).size;
    final GlobalKey<FormState> formKey = GlobalKey();

    var height = size.height;
    var width = size.width;


    return Scaffold(
      bottomNavigationBar: Container(
        padding: EdgeInsets.only(left:200),
        child: Padding(
            padding: EdgeInsets.all(20),
            child: button(widthP: 2,color: kPrimaryColor, text: 'ADD', textColor: Colors.white, radius: 10, press: (){},)),
      )
      ,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'Credit Cards',
          style: TextStyle(fontFamily: 'second', color: Colors.black),
        ),
        leading: BackButton(
          color: Colors.black,
        ),
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      extendBody: true,
      body: Container(
        padding: EdgeInsets.only(left: width * 0.06, right: width * 0.06),
        child: Container(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [




                buildCreditCard(
                    color: Colors.black,

                    cardNumber: '1323 5467 6351 5367',
                    cardHolder: 'marc maged',
                    cardExpirationDate: '07/24'),
              ],
            ),
          ),
        ),
      ),
    );
  }


}

Widget buildCreditCard({Color color, String cardNumber, String cardHolder, String cardExpirationDate }){
  return Card(
    elevation: 4.0,
    color: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(20),
    ),
    child: Container(
      height: 200,
      padding: EdgeInsets.only(left:16.0, right: 16, bottom: 20),


      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment:MainAxisAlignment.spaceBetween,
        children: [
          buildLogoBlock(),
          Text(cardNumber, style: TextStyle(color: Colors.white, fontFamily: 'second', fontSize: 24),),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [

              buildDetailsBlock(label: 'CARDHOLDER', value: cardHolder),
              buildDetailsBlock(label: 'VALID THRU', value: cardExpirationDate),

            ],
          )

        ],
      ) ,
    ),

  );
}

Widget buildDetailsBlock({String label , String value }){
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,

    children: [
Text(label, style:TextStyle(color: Colors.grey, fontSize: 14, fontFamily: 'second') ,),
Text(value, style:TextStyle(color: Colors.white, fontSize: 19, fontFamily: 'second') ,),


    ],
  );



}

Widget buildLogoBlock(){

  return Padding(
    padding: EdgeInsets.only(top: 3),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Image.asset('assets/creditcard/contact_less.png', height: 40,width: 40,),

Image.asset('assets/creditcard/mastercard.png', height: 50,width: 50,),
      ],
    ),
  );

}

