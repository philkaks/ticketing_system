// ignore_for_file: library_private_types_in_public_api

import 'package:flutter/material.dart';

import '../const.dart';

class CienmaSeat extends StatefulWidget {
  bool isReserved;

  bool isSelected;
  //int price;

  CienmaSeat({
    Key? key,
    this.isReserved = false,
    this.isSelected = false,
     //this.price= widget.price,
  }) : super(key: key);

  @override
  _CienmaSeatState createState() => _CienmaSeatState();
}

class _CienmaSeatState extends State<CienmaSeat> {
  @override
  Widget build(BuildContext context) {
    return InkWell(
      splashColor: Colors.transparent,
      highlightColor: Colors.transparent,
      onTap: () {
        setState(() {
          !widget.isReserved ? widget.isSelected = !widget.isSelected : null;
          //widget.counter++;
        });
      },
      child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 7.0, vertical: 5.0),
          width: MediaQuery.of(context).size.width / 15,
          height: MediaQuery.of(context).size.width / 15,
          decoration: BoxDecoration(
              color: widget.isSelected
                  ? kPimaryColor
                  : widget.isReserved
                      ? Colors.red
                      : null,
              border: !widget.isSelected && !widget.isReserved
                  ? Border.all(color: Colors.white, width: 1.0)
                  : null,
              borderRadius: BorderRadius.circular(5.0),),),
    );
  }
}
