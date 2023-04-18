import 'package:flutter/material.dart';

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${substring(1)}";
  }
}

extension PaddingAll on Widget {
  Widget paddingAll(double value) {
    return Padding(
      padding: EdgeInsets.all(value),
      child: this,
    );
  }
}

extension PaddingSymmetric on Widget {
  Widget paddingSymmetric({double vertical = 0, double horizontal = 0}) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: vertical, horizontal: horizontal),
      child: this,
    );
  }
}

extension PaddingFromLTRB on Widget {
  Widget paddingFromLTRB(double left, double top, double right, double bottom) {
    return Padding(
      padding: EdgeInsets.fromLTRB(left, top, right, bottom),
      child: this,
    );
  }
}

extension PaddingOnly on Widget {
  Widget paddingOnly(
      {double left = 0, double top = 0, double right = 0, double bottom = 0}) {
    return Padding(
      padding:
          EdgeInsets.only(left: left, top: top, right: right, bottom: bottom),
      child: this,
    );
  }
}

extension DecoratedContainer on Widget {
  Widget decoratedContainer(
      {Color color = Colors.white,
      double? width,
      double? height,
      double radius = 10,
      double? elevation,
      EdgeInsetsGeometry? padding}) {
    return Container(
      width: width,
      height: height,
      padding: padding,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(radius),
        boxShadow: elevation != null
            ? [
                BoxShadow(
                  color: Colors.black12,
                  blurRadius: elevation,
                  offset: Offset(0, elevation),
                ),
              ]
            : null,
      ),
      child: this,
    );
  }
}
