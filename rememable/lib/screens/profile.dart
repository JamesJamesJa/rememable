import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rememable/providers/allFlashcard.dart';
import 'package:rememable/providers/authen.dart';
import 'package:rememable/screens/login.dart';
import 'package:rememable/screens/study-set.dart';

class Profile extends StatefulWidget {
  final int selectedTabIndex;
  final Function changeIndex;
  const Profile({
    Key key,
    this.selectedTabIndex,
    this.changeIndex,
  }) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer2<Authen, AllFlashcard>(
        builder: (context, user, allFlashcard, child) {
      return Container(
        width: double.infinity,
        child: Stack(
          children: <Widget>[
            Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height * 0.17,
                color: Color(0xFF749BFF)),
            Container(
              margin: EdgeInsets.only(top: 80, left: 40),
              child: CircleButton(
                  onTap: () => Navigator(),
                  iconData: Icons.add_a_photo_rounded),
            ),
            Container(
              margin: EdgeInsets.only(top: 110, left: 150),
              child: Text(user.getName(),
                  style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
            ),
            GestureDetector(
              onTap: () => Navigator.push(
                  context, MaterialPageRoute(builder: (context) => StudySet())),
              child: Container(
                alignment: Alignment.center,
                width: MediaQuery.of(context).size.width * 0.75,
                height: 150,
                margin: EdgeInsets.only(top: 210.0, left: 50),
                decoration: BoxDecoration(
                  color: Color(0xFFF3F3F3),
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
                  child: Text(
                    'My Study Sets',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        fontSize: 18,
                        color: Color(0xFF909090),
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              margin: EdgeInsets.only(top: 400),
              color: Color(0xFFF3F3F3),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: EdgeInsets.only(bottom: 18),
                    child: GestureDetector(
                      child: Row(
                        children: [
                          Container(
                              width: MediaQuery.of(context).size.width * 0.15,
                              alignment: Alignment.centerRight,
                              child: Icon(
                                Icons.email,
                                color: Color(0xFFAFAFAF),
                                size: 24.0,
                              )),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.2,
                            padding: EdgeInsets.only(left: 15),
                            child: Text('Email'),
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            width: MediaQuery.of(context).size.width * 0.5,
                            child: Text(user.getEmail()),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            padding: EdgeInsets.only(left: 5),
                            width: MediaQuery.of(context).size.width * 0.15,
                            child: Icon(
                              Icons.navigate_next,
                              color: Color(0xFFAFAFAF),
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(bottom: 18),
                    child: GestureDetector(
                      child: Row(
                        children: [
                          Container(
                              alignment: Alignment.centerRight,
                              width: MediaQuery.of(context).size.width * 0.15,
                              child: Icon(
                                Icons.person,
                                color: Color(0xFFAFAFAF),
                                size: 24.0,
                              )),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.25,
                            padding: EdgeInsets.only(left: 15),
                            child: Text('Name'),
                          ),
                          Container(
                            width: MediaQuery.of(context).size.width * 0.45,
                            alignment: Alignment.centerRight,
                            child: Text(user.getName()),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * 0.15,
                            padding: EdgeInsets.only(left: 5),
                            child: Icon(
                              Icons.navigate_next,
                              color: Color(0xFFAFAFAF),
                              size: 24.0,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.pushReplacement(context,
                          MaterialPageRoute(builder: (context) => Login()));
                      user.logout();
                      Future.delayed(const Duration(milliseconds: 1000), () {
                        allFlashcard.logout();
                      });
                    },
                    child: Container(
                      color: Colors.transparent,
                      child: Row(
                        children: [
                          Container(
                              alignment: Alignment.centerRight,
                              width: MediaQuery.of(context).size.width * 0.15,
                              child: Icon(
                                Icons.logout,
                                color: Color(0xFFAFAFAF),
                                size: 24.0,
                              )),
                          Container(
                            padding: EdgeInsets.only(left: 15),
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * 0.7,
                            child: Text('Logout'),
                          ),
                          Container(
                            padding: EdgeInsets.only(left: 5),
                            alignment: Alignment.centerLeft,
                            width: MediaQuery.of(context).size.width * 0.15,
                            child: Icon(
                              Icons.navigate_next,
                              color: Color(0xFFAFAFAF),
                              size: 24.0,
                            ),
                          )
                        ],
                      ),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      );
    }));
  }
}

class CircleButton extends StatelessWidget {
  final GestureTapCallback onTap;
  final IconData iconData;

  const CircleButton({Key key, this.onTap, this.iconData}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size = 100.0;

    return new InkResponse(
      onTap: onTap,
      child: new Container(
        width: size,
        height: size,
        decoration: new BoxDecoration(
          color: Color(0xFFC4C4C4),
          shape: BoxShape.circle,
        ),
        child: new Icon(
          iconData,
          color: Color(0xFF929191),
        ),
      ),
    );
  }
}
