import 'package:final_project/data_print.dart/avatar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class user_profile extends StatelessWidget {
  const user_profile({super.key,required this.name, required this.email, required this.image});
  final String name;
  final String email;
  final String image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        centerTitle: true,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        shadowColor: Colors.black,
        elevation: 5,
        leading: IconButton(
          onPressed: () {},
          icon: Icon(Icons.arrow_back),
        ),
        title: Text(
          'Profile',
          style: GoogleFonts.playfairDisplay(
            textStyle: TextStyle(color: Color.fromRGBO(108, 76, 54, 1.0),fontSize: 25),
          ),
        ),
      ),
      body: Container(
        //height: 120,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 20),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    name,
                    style: TextStyle(fontSize: 30),
                  ),
                  Text(
                    email,
                    style: TextStyle(fontSize: 15),
                  )
                ],
              ),
              SizedBox(
                width: 60,
              ),
              Avatar(name: "Deepika")
            ],
          ),
        ),
      ),
    );
  }
}