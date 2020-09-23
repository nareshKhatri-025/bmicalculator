import 'package:flutter/material.dart';
import '../constants.dart';
class BottomButton extends StatelessWidget {


  final String text;
  final Function onTap;
  BottomButton({@required this.text,@required this.onTap});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap:onTap
      ,
      child: Container(
          child:Center(child: Text(text,style: kLargeButtonTextStyle,)),
          color: kBottomContainerColour,
          margin: EdgeInsets.only(top: 10.0),
          width: double.infinity,
          height: kBottomHighetContainer,
          padding: EdgeInsets.only(bottom: 20.0
          )
      ),
    );
  }
}