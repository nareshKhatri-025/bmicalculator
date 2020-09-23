import 'package:flutter/material.dart';

class ResuseableCard extends StatelessWidget {
  final Color colour;
  ResuseableCard({@required this.colour,this.cardChild,this.onPress});
  final Widget cardChild;
  final Function onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: cardChild,
        decoration: BoxDecoration(
          color: colour,
          borderRadius: BorderRadius.circular(10.0),
        ),
        margin: EdgeInsets.all(15),
      ),
    );
  }
}