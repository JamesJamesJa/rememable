import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:kelena/models/user.dart';
// import 'package:kelena/providers/student.dart';
// import 'package:kelena/screens/firstCome.dart';
// import 'package:kelena/screens/instructorTime.dart';
// import 'package:kelena/widgets/student/dialogAddSchedule.dart';
// import 'package:provider/provider.dart';

class FlashcardDetails extends StatefulWidget {
  // final User teacher;
  // final String id, name, classNow;
  // final bool fav;
  // final int index;
  // final int selectedTabIndex;
  // final Function changeIndex;
  const FlashcardDetails({
    Key key,
    // this.teacher,
    // this.id,
    // this.name,
    // this.classNow,
    // this.fav,
    // this.index,
    // this.selectedTabIndex,
    // this.changeIndex,
  }) : super(key: key);
  @override
  _FlashcardDetailsState createState() => _FlashcardDetailsState();
}

class _FlashcardDetailsState extends State<FlashcardDetails> {
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFFAFAFA),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF749BFF),
              child: Center(
                child: Container(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    'Number Addition',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.88,
              // padding: EdgeInsets.only(top: 10),
              child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                child: Column(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(2, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(left: 40, top: 14, bottom: 10),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              'images/category-math-cover.jpeg',
                              height: 220,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 190, left: 20),
                            child: Text(
                              'Math',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(2, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(left: 30, top: 14, bottom: 10),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              'images/category-science-cover2.jpeg',
                              height: 220,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 190, left: 20),
                            child: Text(
                              'Science',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(2, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(left: 30, top: 14, bottom: 10),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              'images/category-language-cover.jpeg',
                              height: 220,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 190, left: 20),
                            child: Text(
                              'Language',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 7,
                            offset: Offset(2, 3),
                          ),
                        ],
                      ),
                      margin: EdgeInsets.only(
                          left: 30, top: 14, bottom: 10, right: 40),
                      child: Stack(
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: Image.asset(
                              'images/category-coding-cover.jpeg',
                              height: 220,
                              width: 150,
                              fit: BoxFit.cover,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 190, left: 20),
                            child: Text(
                              'Coding',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Color(0xFF000000),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
