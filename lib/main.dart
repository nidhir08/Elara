import 'package:final_project/Provider/cartNotifier.dart';
import 'package:final_project/Provider/wishlistNotifier.dart';
import 'package:final_project/bloc/user_bloc.dart';
import 'package:final_project/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:provider/provider.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
);
  runApp(
    MultiProvider(
      providers: [
        BlocProvider(create: (c)=>UserCubit()),
        ChangeNotifierProvider(create: (context) => WishlistNotifier(),),
        ChangeNotifierProvider(create: (context) => Cartnotifier()),
      ],
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: SplashScreen(),
      ),
    ),
  );
}


