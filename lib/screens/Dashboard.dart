import 'package:final_project/screens/Cart.dart';
import 'package:final_project/screens/Home.dart';
import 'package:final_project/screens/UserScren.dart';
import 'package:final_project/screens/wishlist.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';

class Dasboard extends StatefulWidget {
  const Dasboard({super.key, required this.name, required this.email, required this.image});
  final String name;
  final String email;
  final String image;

  @override
  State<Dasboard> createState() => _DasboardState();
}

class _DasboardState extends State<Dasboard> {
  int currentIndex = 0;
  String _locationMessage = "Fetching location...";

  List screens = [Home(), CartScreen(), WishlistScreen(), user_profile(name: "Deepika", email: "paliwaldeepika6@gmail.com", image: "")];

  @override
  void initState() {
    super.initState();
    _determinePosition();
  }

  Future<void> _determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      setState(() {
        _locationMessage = "Location services are disabled.";
      });
      return;
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission != LocationPermission.whileInUse && permission != LocationPermission.always) {
        setState(() {
          _locationMessage = "Location permission denied.";
        });
        return;
      }
    }

    try {
      Position position = await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
      List<Placemark> placemarks = await placemarkFromCoordinates(position.latitude, position.longitude);
      Placemark placemark = placemarks[0];
      setState(() {
        _locationMessage = "${placemark.locality}, ${placemark.administrativeArea}, ${placemark.country}";
      });
    } catch (e) {
      setState(() {
        _locationMessage = "Failed to fetch location.";
      });
    }
  }

  double _getFontSize(BuildContext context, double factor) {
    double width = MediaQuery.of(context).size.width;
    return width * factor;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        //elevation: 10,
        shadowColor: Colors.black,
        backgroundColor: Colors.white,
        surfaceTintColor: Colors.white,
        toolbarHeight: MediaQuery.of(context).size.height * 0.09,
        leading: Padding(
          padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.04),
          child: Row(
            children: [
              Icon(
                Icons.location_pin,
                color: Color.fromRGBO(108, 76, 54, 1.0),
                size: _getFontSize(context, 0.045), // Adjust icon size
              ),
              SizedBox(width: MediaQuery.of(context).size.width * 0.02), // Space between icon and text
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Location",
                    style: GoogleFonts.playfairDisplay(
                      color: Color.fromRGBO(108, 76, 54, 1.0),
                      fontSize: _getFontSize(context, 0.036), // Dynamic font size for title
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(
                    width: MediaQuery.of(context).size.width * 0.4,
                    child: Text(
                      _locationMessage,
                      style: GoogleFonts.playfairDisplay(
                        color: Color.fromRGBO(108, 76, 54, 1.0),
                        fontSize: _getFontSize(context, 0.03), // Dynamic font size for message
                      ),
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: EdgeInsets.only(
                right: MediaQuery.of(context).size.width * 0.04),
            child: IconButton(
              onPressed: () {},
              icon: Icon(Icons.notifications),
            ),
          ),
        ],
        leadingWidth: 300, // Adjust leading width to accommodate both icon and text
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Colors.white,
        unselectedItemColor: Color.fromRGBO(108, 76, 54, 1.0),
        selectedItemColor: Color.fromRGBO(108, 76, 54, 1.0),
        showUnselectedLabels: true,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "Home"),
          BottomNavigationBarItem(icon: Icon(Icons.shopping_bag_rounded), label: "Cart"),
          BottomNavigationBarItem(icon: Icon(Icons.favorite), label: "Wishlist"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "User"),
        ],
        onTap: (index) {
          setState(() {
            currentIndex = index;
          });
        },
      ),
      body: screens[currentIndex],
    );
  }
}
