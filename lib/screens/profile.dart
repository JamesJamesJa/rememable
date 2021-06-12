import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

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
    return Scaffold(
      body: Container(
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
              child: Text('Teerapat M.',
                  style: GoogleFonts.montserrat(
                      fontSize: 24,
                      fontWeight: FontWeight.w400,
                      color: Colors.white)),
            ),
            GestureDetector(
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
                  // padding: EdgeInsets.only(left: 0, right: 0),
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
              // onTap: () {
              //   Navigator.pushReplacement(context,
              //       MaterialPageRoute(builder: (context) => ));
              // },
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.15,
              margin: EdgeInsets.only(top: 400),
              color: Colors.grey,
              child: Column(
                children: [
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text('Email'),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text('Name'),
                  ),
                  Container(
                    margin: EdgeInsets.all(10),
                    child: Text('Log out'),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
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
