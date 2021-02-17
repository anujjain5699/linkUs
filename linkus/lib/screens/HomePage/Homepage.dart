import 'package:flutter/material.dart';
import 'package:linkus/constants/Constantcolors.dart';

class Homepage extends StatelessWidget {

  final ConstantColors constantColors=ConstantColors();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: constantColors.redColor,
    );
  }
}