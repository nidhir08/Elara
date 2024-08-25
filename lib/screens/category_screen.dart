
import 'package:final_project/data_print.dart/category_data.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.category_name});
  final String category_name;
  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        surfaceTintColor: Colors.white,
        toolbarHeight: 60,
        backgroundColor: Colors.white,
        leading: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            decoration: BoxDecoration(
              //color: Colors.yellow,
              shape: BoxShape.circle,
              border: Border.all(color: Colors.black38),
            ),
            child: IconButton(
              onPressed: () {Navigator.pop(context);},
              icon: const Icon(
                Icons.arrow_back,
                color: Color.fromRGBO(108, 76, 54, 1),
                size: 25,
              ),
            ),
          ),
        ),
        title: Text(
          widget.category_name.toUpperCase(),
          style: GoogleFonts.playfairDisplay(
            fontSize: 25,
            color: const Color.fromRGBO(108, 76, 54, 1),
          ),
        ),
        centerTitle: true,
        shadowColor: Color.fromRGBO(108, 76, 54, 1),
        elevation: 5,
      ),
      body: CategoryData(name: widget.category_name),
    );
  }
}
