

import 'package:flutter/material.dart';

class Avatar extends StatelessWidget {
  const Avatar({super.key,required this.name});
  final String name;
  @override
  Widget build(BuildContext context) {
    List<Color> colors = [Color.fromRGBO(245, 245, 220, 1),Color.fromRGBO(178, 184, 163, 1),Color.fromRGBO(234, 211, 203, 1),Color.fromRGBO(163, 183, 197, 1),Color.fromRGBO(167, 142, 132, 1),Color.fromRGBO(221, 214, 229, 1),Color.fromRGBO(240, 128, 128, 1),Color.fromRGBO(186, 184, 108, 1),Color.fromRGBO(119, 136, 153, 1),Color.fromRGBO(210, 180, 140, 1)];
    colors.shuffle();
    return CircleAvatar(
      radius: 25,
      backgroundColor: colors[0],
      child: Text("${name[0].toUpperCase()}",style: TextStyle(fontSize: 25,color: Colors.white),),
    );
  }
}