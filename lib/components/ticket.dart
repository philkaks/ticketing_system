import 'package:flutter/material.dart';
import 'package:ticket_widget/ticket_widget.dart';
import 'package:barcode_widget/barcode_widget.dart';
import 'package:ticketing_system/const.dart';

class MyTicketView extends StatelessWidget {
  MyTicketView({
    Key? key,
  }) : super(key: key);

  DateTime now = DateTime.now();
  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: kBackgroundColor,
      body: Center(
        child: TicketWidget(
          width: 350,
          height: 500,
          isCornerRounded: true,
          padding: EdgeInsets.all(20),
          child: TicketData(),
        ),
      ),
    );
  }
}

class TicketData extends StatelessWidget {
  const TicketData({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String datetime = DateTime.now().toString();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              width: 120.0,
              height: 25.0,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30.0),
                border: Border.all(width: 1.0, color: Colors.green),
              ),
              child: const Center(
                child: Text(
                  'Confirmed ',
                  style: TextStyle(color: Colors.green),
                ),
              ),
            ),
          ],
        ),
        const Padding(
          padding: EdgeInsets.only(top: 20.0),
          child: Text('Movie Ticket',
              style: TextStyle(
                  color: Colors.black,
                  fontSize: 20.0,
                  fontWeight: FontWeight.bold)),
        ),
        Padding(
          padding: const EdgeInsets.only(top: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ticketDetailsWidget('', '', 'Date', datetime),
              // Padding(
              //   padding: const EdgeInsets.only(top: 12.0, right: 52.0),
              //   child: ticketDetailsWidget('Flight', '76836A45', 'Gate', '66B'),
              // ),
              Padding(
                padding: const EdgeInsets.only(top: 12.0, right: 53.0),
                child: ticketDetailsWidget('Class', 'Ordinary', 'Grounds', ''),
              ),
            ],
          ),
        ),
        Padding(
            padding: const EdgeInsets.only(top: 60.0, left: 20.0, right: 30.0),
            child: BarcodeWidget(
              barcode: Barcode.code128(),
              data: 'Thank you',
            )),
        const Padding(
          padding: EdgeInsets.only(top: 10.0, left: 75.0, right: 75.0),
          child: Center(
            child: Text(
              'For support contact\n +256 770 429 453\n +256 782 810 367',
              style: TextStyle(
                color: Colors.black,
              ),
            ),
          ),
        ),
        const SizedBox(height: 30),
        const Text('         ')
      ],
    );
  }
}

Widget ticketDetailsWidget(String firstTitle, String firstDesc,
    String secondTitle, String secondDesc) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Padding(
        padding: const EdgeInsets.only(left: 12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              firstTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                firstDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      ),
      Padding(
        padding: const EdgeInsets.only(right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              secondTitle,
              style: const TextStyle(color: Colors.grey),
            ),
            Padding(
              padding: const EdgeInsets.only(top: 4.0),
              child: Text(
                secondDesc,
                style: const TextStyle(color: Colors.black),
              ),
            )
          ],
        ),
      )
    ],
  );
}
