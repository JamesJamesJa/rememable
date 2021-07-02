import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rememable/screens/home.dart';
import 'package:rememable/screens/pre-home.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/bg-color.png"),
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(
                  top: MediaQuery.of(context).size.height * 0.12),
              child: Image.asset(
                'images/logo.png',
                height: 180,
                width: 180,
              ),
            ),
            Container(
              alignment: Alignment.center,
              child: Text("Sign in",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Color(0xFF687E9E),
                          fontSize: 26.0,
                          fontWeight: FontWeight.w400))),
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10.0),
              child: Text("to continue to Rememable",
                  style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Color(0xFF687E9E),
                          fontSize: 16.0,
                          fontWeight: FontWeight.w400))),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.7,
              height: 50,
              margin: EdgeInsets.only(top: 30.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(2, 3),
                  ),
                ],
              ),
              child: Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 20, 10),
                  child: TextField(
                    decoration: InputDecoration(
                        icon: Container(
                          padding: EdgeInsets.only(left: 10.0, top: 5),
                          child: Icon(
                            Icons.email,
                            size: 20,
                            color: Color(0xFF687E9E),
                          ),
                        ),
                        border: InputBorder.none,
                        hintText: 'Email',
                        hintStyle: TextStyle(
                          color: Color(0xFFC7C7CC),
                          fontSize: 12.0,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Montserrat',
                        ),
                        contentPadding: EdgeInsets.only(bottom: 6.0)),
                  )),
            ),
            Container(
              alignment: Alignment.center,
              width: MediaQuery.of(context).size.width * 0.7,
              height: 50,
              margin: EdgeInsets.only(top: 20.0),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 7,
                    offset: Offset(2, 3),
                  ),
                ],
              ),
              child: Container(
                  padding: EdgeInsets.fromLTRB(10, 5, 20, 10),
                  child: TextField(
                    enableSuggestions: false,
                    autocorrect: false,
                    obscureText: true,
                    decoration: InputDecoration(
                        icon: Container(
                          padding: EdgeInsets.only(left: 10.0, top: 5),
                          child: Icon(
                            Icons.vpn_key,
                            size: 20,
                            color: Color(0xFF687E9E),
                          ),
                        ),
                        border: InputBorder.none,
                        hintText: 'Password',
                        hintStyle: TextStyle(
                          color: Color(0xFFC7C7CC),
                          fontSize: 12.0,
                          fontWeight: FontWeight.w300,
                          fontFamily: 'Montserrat',
                        ),
                        contentPadding: EdgeInsets.only(bottom: 6.0)),
                  )),
            ),
            GestureDetector(
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.7,
                height: 50,
                margin: EdgeInsets.only(top: 60.0),
                decoration: BoxDecoration(
                  color: Color(0xFF6C76C7),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey.withOpacity(0.5),
                      spreadRadius: 2,
                      blurRadius: 7,
                      offset: Offset(2, 3),
                    ),
                  ],
                ),
                child: Container(
                    padding: EdgeInsets.only(left: 0, right: 10),
                    child: Text(
                      'Sign In',
                      style: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                          fontSize: 17,
                          color: Colors.white,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    )),
              ),
              onTap: () {
                Navigator.pushReplacement(context,
                    MaterialPageRoute(builder: (context) => PreHome()));
              },
            ),
          ],
        ),
      ),
    );
  }
}