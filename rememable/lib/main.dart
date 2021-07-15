import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rememable/providers/allFlashcard.dart';
import 'package:rememable/providers/authen.dart';
import 'package:rememable/screens/login.dart';

void main() => runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => AllFlashcard()),
          ChangeNotifierProvider(create: (context) => Authen()),
          // ChangeNotifierProvider(create: (context) => Teacher()),
          //     ChangeNotifierProxyProvider<AllFlashcard, Authen>(
          //     update: (context, allFlashcard, authen) => Authen(allFlashcard),
          // create: (BuildContext context) => Authen(),
          //   ),
        ],
        child: App(),
      ),
    );

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        textTheme: GoogleFonts.montserratTextTheme(
          Theme.of(context).textTheme,
        ),
      ),
      home: MyApp(),
    );
  }
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Login();
  }
}
