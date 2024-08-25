import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NewPasscode extends StatefulWidget {
  const NewPasscode({super.key});

  @override
  State<NewPasscode> createState() => _NewPasscodeState();
}

class _NewPasscodeState extends State<NewPasscode> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
            onPressed: () {}, icon: const Icon(Icons.arrow_back_rounded)),
      ),
      backgroundColor: Colors.white,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Column(
                children: [
                  SizedBox(
                    height: 40,
                  ),
                  Text(
                    "New Passcode",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(108, 76, 54, 1)),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  SizedBox(
                    width: 270,
                    child: Text(
                      textAlign: TextAlign.center,
                      maxLines: 3,
                      "Your new passcode should be different from the previous one",
                    ),
                  ),
                ],
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 30),
              child: Text(
                "Passcode",
                style: GoogleFonts.playfairDisplay(
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(108, 76, 54, 1),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Create Passcode',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  hintStyle: TextStyle(
                      color: Colors.black38, fontWeight: FontWeight.w500)),
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text(
                "Confirm Passcode",
                style: GoogleFonts.playfairDisplay(
                  textStyle: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(108, 76, 54, 1),
                  ),
                ),
              ),
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(left: 15, right: 15, bottom: 30),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Enter New One',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  hintStyle: TextStyle(
                      color: Colors.black38, fontWeight: FontWeight.w500)),
            ),
          ),
          SizedBox(
            width: 330,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Create New Passcode",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: Color.fromRGBO(108, 76, 54, 1)),
            ),
          ),
        ],
      ),
    );
  }
}
