import 'package:flutter/material.dart';

extension Spacing on Text {
  Padding pv(double padding) => Padding(
        padding: EdgeInsets.symmetric(vertical: padding),
        child: this,
      );
  Padding ph(double padding) => Padding(
        padding: EdgeInsets.symmetric(horizontal: padding),
        child: this,
      );
  Padding p(double padding) => Padding(
        padding: EdgeInsets.all(padding),
        child: this,
      );
}

extension customerExt on Widget{
  Widget fitted() => FittedBox(fit: BoxFit.scaleDown,child: this);

}