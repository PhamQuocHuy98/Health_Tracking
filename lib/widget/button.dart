import 'package:flutter/material.dart';

class CustomButton extends StatelessWidget {
  final String title;
  final Function onTap;
  final Color color;
  final double width;
  final double height;
  final TextStyle style;
  CustomButton(
      {this.title = '',
      this.onTap,
      this.color = Colors.blue,
      this.width = 300,
      this.height = 60,
      this.style});
  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(
          20,
        ),
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          // make splash shape fit round button when tap,
          // if not specified, splash shape is rectangle instead of round
          borderRadius: BorderRadius.circular(
            20,
          ),
          highlightColor: Colors.transparent,
          onTap: onTap,
          child: Center(
              child: Text(
            title,
            style: style,
          )),
        ),
      ),
    );
  }
}
