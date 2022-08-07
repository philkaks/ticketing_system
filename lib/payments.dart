// ignore_for_file: avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutterwave/flutterwave.dart';
import 'package:ticketing_system/const.dart';
import 'components/red_rounded_action_button.dart';
import 'components/ticket.dart';



class Payments extends StatefulWidget {
  final int price;
  bool isActive;
  bool transactionCompleted;
  Payments(
    this.price, {
    Key? key,
    this.isActive = false,
    this.transactionCompleted = false,
  }) : super(key: key);

  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends State<Payments> {
      
  final String currency = FlutterwaveCurrency.UGX;
  final formKey = GlobalKey<FormState>();
  final TextEditingController fullname = TextEditingController();
  final TextEditingController phone = TextEditingController();
  final TextEditingController email = TextEditingController();
  TextEditingController amount = TextEditingController();

  @override
  Widget build(context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Payments',
          style: kMovieNameStyle,
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Padding(padding: EdgeInsets.all(10.0)),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    style: kMainTextStyle,
                    controller: fullname,
                    decoration: const InputDecoration(labelText: "Full Name"),
                    validator: (value) =>
                        value!.isNotEmpty ? null : "Please fill in Your Name",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    cursorColor: Colors.white,
                    style: kMainTextStyle,
                    controller: phone,
                    decoration:
                        const InputDecoration(labelText: "Phone Number"),
                    validator: (value) => value!.isNotEmpty
                        ? null
                        : "Please fill in Your Phone number",
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(bottom: 10),
                  child: TextFormField(
                    style: kSmallMainTextStyle,
                    controller: email,
                    decoration: const InputDecoration(labelText: "Email"),
                    validator: (value) =>
                        value!.isNotEmpty ? null : "Please fill in Your Email",
                  ),
                ),
                // Container(
                //   margin: const EdgeInsets.only(bottom: 10),
                //   child: TextFormField(
                //     controller: amount,
                //     decoration: const InputDecoration(labelText: "Amount"),
                //     validator: (value) => value!.isNotEmpty
                //         ? null
                //         : "Please fill in the Amount you are Paying",
                //   ),
                // ),
                RedRoundedActionButton(
                  text: 'Proceed Payment',
                  callback: () {
                    final name = fullname.text;
                    final userPhone = phone.text;
                    final userEmail = email.text;
                    final amountPaid = widget.price.toString();

                    if (formKey.currentState!.validate()) {
                      _makeFlutterwavePayment(
                          context, name, userPhone, userEmail, amountPaid);
                      //if the payment is successful, the transactionCompleted will be set to true
                      //and the payment page will be closed
                      //else, the transactionCompleted will be set to false and the payment page will be closed

                      setState(() {
                        widget.transactionCompleted = true;
                        widget.isActive = !widget.isActive;
                      });
                    }
                    
                  },
                ),
                

                InkWell(
                  //on tap should only be called when the transactionCompleted is true
                  onTap: () {
                    if (widget.transactionCompleted) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => MyTicketView(),
                        ),
                      );
                    }
                  },

                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,

                  child: Container(
                    margin: const EdgeInsets.all(15.0),
                    padding: const EdgeInsets.symmetric(
                        horizontal: 25.0, vertical: 10.0),
                    decoration: BoxDecoration(
                        border: Border.all(
                            color: widget.isActive
                                ? kPimaryColor
                                : Colors.white12),
                        borderRadius: BorderRadius.circular(15.0)),
                    child: Column(
                      children: <Widget>[
                        Text(
                          'View Ticket',
                          style: TextStyle(
                              color:
                                  widget.isActive ? kPimaryColor : Colors.white,
                              fontSize: 20.0,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                )
            
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _makeFlutterwavePayment(BuildContext context, String fullname,
      String phone, String email, String amount) async {
    try {
      Flutterwave flutterwave = Flutterwave.forUIPayment(
          //the first 10 fields below are required/mandatory
          context: this.context,
          fullName: fullname,
          phoneNumber: phone,
          email: email,
          amount: amount,
          //Use your Public and Encription Keys from your Flutterwave account on the dashboard
          encryptionKey: "FLWSECK_TEST02ba6ff35de2",
          publicKey: "FLWPUBK_TEST-bb7f44312cea07a241ac715d9a439abd-X",
          currency: currency,
          txRef: DateTime.now().toIso8601String(),
          //Setting DebugMode below to true since will be using test mode.
          //You can set it to false when using production environment.
          isDebugMode: true,
          //configure the the type of payments that your business will accept
          acceptCardPayment: true,
          acceptUSSDPayment: true,
          acceptAccountPayment: true,
          acceptFrancophoneMobileMoney: false,
          acceptGhanaPayment: false,
          acceptMpesaPayment: true,
          acceptRwandaMoneyPayment: false,
          acceptUgandaPayment: true,
          acceptZambiaPayment: false);
      final response = await flutterwave.initializeForUiPayments();
      if (response == null) {
        print("Transaction Failed");
      } else {
        if (response.status == "Transaction successful") {
          print(response.data);
          print(response.message);
        } else {
          print(response.message);
        }
      }
    } catch (error) {
      print(error);
    }
  }
}
