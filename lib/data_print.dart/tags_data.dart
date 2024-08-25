
import 'package:final_project/formatting.dart';
import 'package:flutter/material.dart';

class TagsData extends StatelessWidget {
  const TagsData({super.key,required this.tags});
  final List<dynamic> tags;

  @override
  Widget build(BuildContext context) {
    Formatting design = Formatting();
    String temp = "";
    int noOfTags = tags.length;
    for(int i=0;i<noOfTags;i++){
      temp = temp + "#" + design.toSentenceCase(tags[i]) + " ";
    }
    return Text(temp,style: TextStyle(color: Colors.black38),);
  }
}