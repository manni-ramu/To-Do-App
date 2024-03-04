import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:to_do_gdsc/screens/homePage.dart';
import 'package:google_fonts/google_fonts.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  if (kIsWeb) {
    await Firebase.initializeApp(
        options: const FirebaseOptions(
            apiKey: "AIzaSyA-xFLy-Eqv2sGnZM0O2wPi1ILi8LEy584",
            appId: "1:313758502899:web:9ded135a9f56687f26cc86",
            messagingSenderId: "313758502899",
            projectId: "community-d58fb"));
  } else {
    Firebase.initializeApp();
  }
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    const primaryColor = Colors.blue;
    const primarySwatch = MaterialColor(
      0xFF000000,
      <int, Color>{
        50: primaryColor,
        100: primaryColor,
        200: primaryColor,
        300: primaryColor,
        400: primaryColor,
        500: primaryColor,
        600: primaryColor,
        700: primaryColor,
        800: primaryColor,
        900: primaryColor,
      },
    );

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'DooIt',
      theme: ThemeData(
        primarySwatch: primarySwatch,
        brightness: Brightness.light,
        textTheme: GoogleFonts.latoTextTheme(),
      ),
      home: const HomePage(),
    );
  }
}
