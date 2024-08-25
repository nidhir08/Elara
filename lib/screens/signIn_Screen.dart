import 'dart:async';
import 'package:final_project/OAuth/googleOAuth.dart';
import 'package:final_project/bloc/user_bloc.dart';
import 'package:final_project/bloc/user_state.dart';
import 'package:final_project/screens/Dashboard.dart';
import 'package:final_project/screens/new_passcode.dart';
import 'package:final_project/screens/profile.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sign_in_button/sign_in_button.dart';


class signIn_Screen extends StatefulWidget {
  const signIn_Screen({super.key});

  @override
  State<signIn_Screen> createState() => _signIn_ScreenState();
}

class _signIn_ScreenState extends State<signIn_Screen> {
  late BuildContext ctx;
  GoogleOauth _auth = GoogleOauth();
  _signinWithGoogle(){
    //Event Fire
    BlocProvider.of<UserCubit>(ctx).LoginEvent();
  }
  _moveToNextScreen(ctx, String name, String email, String url){
    Timer(Duration(seconds: 0), ()=>Navigator.of(context).push(MaterialPageRoute(builder: (context) => Dasboard(name: name, email: email, image: url),)));
  }

  @override
  Widget build(BuildContext context) {
    ctx=context;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          BlocBuilder<UserCubit,UserState>(
            builder: (context,UserState){
             if (UserState.email.length>0) {
              _moveToNextScreen(context, UserState.name, UserState.email, UserState.image);
             }
              return Text("");
            },
          ),
          const Center(
            child: Padding(
              padding: EdgeInsets.only(bottom: 40),
              child: Column(
                children: [
                  Text(
                    "Sign In",
                    style: TextStyle(
                        fontSize: 30,
                        fontWeight: FontWeight.w500,
                        color: Color.fromRGBO(108, 76, 54, 1)),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Text(
                    "Hi Welcome Back , you've been missed!",
                    style: TextStyle(fontSize: 15),
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
                "Email",
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
              decoration: InputDecoration(
                  hintText: 'example@gmail.com',
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                      focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(108, 76, 54, 1)),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  hintStyle: TextStyle(color: Colors.black38)),
            ),
          ),
          Padding(
            padding: EdgeInsets.only(left: 30),
            child: Container(
              alignment: Alignment.topLeft,
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
            padding: EdgeInsets.only(
              left: 15,
              right: 15,
            ),
            child: TextField(
              obscureText: true,
              decoration: InputDecoration(
                  hintText: 'Enter Passcode',
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(
                      Radius.circular(25),
                    ),
                  ),
                  focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: Color.fromRGBO(108, 76, 54, 1)),
                      borderRadius: BorderRadius.all(Radius.circular(25))),
                  hintStyle: TextStyle(color: Colors.black38)),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 20, right: 20),
            child: Container(
                alignment: Alignment.bottomRight,
                child: TextButton(
                    onPressed: (){Navigator.push(context, MaterialPageRoute(builder: (context)=>NewPasscode()));},
                    child: const Text(
                      "Forgot Passcode ?",
                      style: TextStyle(color: Color.fromRGBO(108, 76, 54, 1)),
                    ))),
          ),
          SizedBox(
            width: 330,
            height: 40,
            child: ElevatedButton(
              onPressed: () {},
              child: Text(
                "Sign In",
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
              style: ElevatedButton.styleFrom(
                  backgroundColor: const Color.fromRGBO(108, 76, 54, 1)),
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          const Divider(
            indent: 30,
            endIndent: 30,
          ),
          const Text(
            'or sign in with',
            style: TextStyle(
                fontSize: 17,
                fontWeight: FontWeight.w300,
                color: Colors.black38,),
          ),
          Padding(
            padding: const EdgeInsets.only(top: 20, bottom: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SignInButton(
                  elevation: 5,
                  Buttons.google,
                  //text: "Sign up with Google",
                  onPressed: () {
                    _signinWithGoogle();
                  },
                ),
                SignInButton(
                  elevation: 5,
                  Buttons.facebookNew,
                  onPressed: () {},
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text("Don't have an account ?"),
              TextButton(
                  onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>Profile())),
                  child: const Text(
                    "Sign Up",
                    style: TextStyle(color: Color.fromRGBO(108, 76, 54, 1)),
                  )),
            ],
          )
        ],
      ),
    );
  }
}
