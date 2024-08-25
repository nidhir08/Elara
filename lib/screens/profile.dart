import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:google_fonts/google_fonts.dart';

class Profile extends StatefulWidget {
  const Profile({super.key});

  @override
  State<Profile> createState() => _NewPasscodeState();
}

class _NewPasscodeState extends State<Profile> {
  Uint8List? _image;
  File? selectedIMage;
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
          Center(
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.only(bottom: 20),
                  child: Text(
                    textAlign: TextAlign.center,
                    "Complete Your Profile",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(108, 76, 54, 1)),
                  ),
                ),
                const SizedBox(
                  width: 290,
                  child: Text(
                    textAlign: TextAlign.center,
                    maxLines: 2,
                    "Don't worry, only you can see your personal data. No one else will be able to see it.",
                  ),
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _image != null
                        ? SizedBox(
                            child: Padding(
                              padding: const EdgeInsets.only(top: 15),
                              child: CircleAvatar(
                                  radius: 50,
                                  backgroundImage: MemoryImage(
                                      _image!) // Replace with your image URL or asset
                                  ),
                            ),
                          )
                        : const SizedBox(
                            child: Padding(
                              padding: EdgeInsets.only(top: 15),
                              child: CircleAvatar(
                                radius: 50,
                                backgroundImage: NetworkImage(
                                    "https://www.pngitem.com/pimgs/m/78-786293_1240-x-1240-0-avatar-profile-icon-png.png"), // Replace with your image URL or asset
                              ),
                            ),
                          ),
                    PopupMenuButton<String>(
                      elevation: 10,
                      shadowColor: Colors.black,
                      color: Colors.white,
                      onSelected: (String value) {
                        // Handle menu selection
                        if (value == "Option 1") {
                        } else {}
                      },
                      itemBuilder: (BuildContext context) {
                        return [
                          PopupMenuItem<String>(
                            value: 'Open Camera',
                            child: TextButton(
                              onPressed: () {
                                _pickImageFromCamera();
                              },
                              child: const Text(
                                "Open Camera",
                                style: TextStyle(
                                  color: Color.fromRGBO(108, 76, 54, 1.0),
                                ),
                              ),
                            ),
                          ),
                          PopupMenuItem<String>(
                            value: 'Open Gallery',
                            child: TextButton(
                              onPressed: () {
                                _pickImageFromGallery();
                              },
                              child: const Text(
                                "Choose from Galley",
                                style: TextStyle(
                                  color: Color.fromRGBO(108, 76, 54, 1.0),
                                ),
                              ),
                            ),
                          ),
                        ];
                      },
                      icon: const Icon(Icons
                          .edit_square), // The icon for the PopupMenuButton
                    ),
                  ],
                ),
              ],
            ),
          ),
          const Padding(
            padding: EdgeInsets.only(bottom: 10),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "Name",
                style: GoogleFonts.playfairDisplay(
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(108, 76, 54, 1),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'John Smith',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                hintStyle: GoogleFonts.playfairDisplay(
                  textStyle: const TextStyle(color: Colors.black38),
                ),
              ),
            ),
          ),
          Container(
            alignment: Alignment.bottomLeft,
            child: Padding(
              padding: const EdgeInsets.only(left: 30),
              child: Text(
                "Phone No.",
                style: GoogleFonts.playfairDisplay(
                  textStyle: const TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w500,
                    color: Color.fromRGBO(108, 76, 54, 1),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'eg. 8950365083',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                hintStyle: GoogleFonts.playfairDisplay(
                  textStyle: const TextStyle(color: Colors.black38),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 30),
            child: Container(
              alignment: Alignment.topLeft,
              child: Text("DOB",
                  style: GoogleFonts.playfairDisplay(
                    textStyle: const TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      color: Color.fromRGBO(108, 76, 54, 1),
                    ),
                  )),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 15, bottom: 30),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'eg. 05/06/2004',
                border: const OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25),
                  ),
                ),
                hintStyle: GoogleFonts.playfairDisplay(
                  textStyle: const TextStyle(color: Colors.black38),
                ),
              ),
            ),
          ),
          SizedBox(
            width: 330,
            height: 50,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color.fromRGBO(108, 76, 54, 1),
              ),
              child: const Text(
                "Complete Profile",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future _pickImageFromGallery() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.gallery);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
  }

  Future _pickImageFromCamera() async {
    final returnImage =
        await ImagePicker().pickImage(source: ImageSource.camera);
    if (returnImage == null) return;
    setState(() {
      selectedIMage = File(returnImage.path);
      _image = File(returnImage.path).readAsBytesSync();
    });
  }
}
