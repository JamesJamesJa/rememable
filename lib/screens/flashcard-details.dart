import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rememable/screens/flashcard-test.dart';
import 'package:rememable/screens/play-flashcard.dart';
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
              child: Row(
                // mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.15,
                    padding: EdgeInsets.only(top: 30.0, left: 0.0),
                    child: IconButton(
                        icon: Icon(
                          Icons.arrow_back_rounded,
                          size: 26,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        }),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    padding: EdgeInsets.only(top: 40),
                    child: Center(
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
                  Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    width: MediaQuery.of(context).size.width * 0.15,
                    padding: EdgeInsets.only(top: 40.0, right: 10.0),
                    child: IconButton(
                        icon: Icon(
                          Icons.more_horiz_rounded,
                          size: 26,
                          color: Colors.white,
                        ),
                        onPressed: () {
                          // Navigator.pop(context);
                        }),
                  ),
                ],
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
                      height: 80,
                      // color: Colors.red,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            padding: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.1),
                            child: Text(
                              "Owner",
                              style: TextStyle(
                                  color: Color(0xFFB8B8B8),
                                  fontWeight: FontWeight.w200,
                                  fontSize: 14.0),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(right: 40),
                            child: IconButton(
                              icon: Icon(
                                // widget.fav ? Icons.favorite :
                                Icons.favorite_outline,
                                size: 28,
                                color: Color(0xFFFFAFCC),
                              ),
                              onPressed: () {
                                // student.manageFav(widget.id);
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(8),
                      child: Image.asset(
                        'images/flashcard-cover-2.jpeg',
                        height: 160,
                        width: 160,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Container(
                      height: 80,
                      padding: EdgeInsets.only(
                          left: MediaQuery.of(context).size.width * 0.12),
                      child: Container(
                        margin: EdgeInsets.only(top: 30),
                        child: Row(
                          children: [
                            Container(
                              padding: EdgeInsets.only(right: 10),
                              child: Text(
                                "Rating",
                                style: TextStyle(
                                    color: Color(0xFF6C76C7),
                                    fontWeight: FontWeight.w200,
                                    fontSize: 18.0),
                              ),
                            ),
                            Icon(
                              // widget.fav ? Icons.favorite :
                              Icons.star_outlined,
                              size: 28,
                              color: Color(0xFFFFDA55),
                            ),
                            Icon(
                              Icons.star_outlined,
                              size: 28,
                              color: Color(0xFFFFDA55),
                            ),
                            Icon(
                              Icons.star_outlined,
                              size: 28,
                              color: Color(0xFFFFDA55),
                            ),
                            Icon(
                              Icons.star_half_outlined,
                              size: 28,
                              color: Color(0xFFFFDA55),
                            ),
                            Icon(
                              Icons.star_border_outlined,
                              size: 28,
                              color: Color(0xFFFFDA55),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      // height: MediaQuery.of(context).size.height * 0.38,
                      width: MediaQuery.of(context).size.width * 0.8,
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
                      margin: EdgeInsets.only(top: 10),
                      padding: EdgeInsets.only(
                          left: 30, top: 34, bottom: 34, right: 30),
                      child: Column(
                        // mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            child: Text(
                              'Name : Number Addition',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Color(0xFF6C76C7),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              'By : Dr.Peil Foden',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Color(0xFF6C76C7),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              'Topic : Numeric',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Color(0xFF6C76C7),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              'Category : Math',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Color(0xFF6C76C7),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 20),
                            child: Text(
                              'Description : This flashcard will teach you about basic of number addition',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Color(0xFF6C76C7),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.38,
                            height: 44,
                            margin: EdgeInsets.only(
                                left: MediaQuery.of(context).size.width * 0.1,
                                top: 50),
                            decoration: BoxDecoration(
                              color: Color(0xFFB0C4F7),
                              borderRadius: BorderRadius.circular(10),
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
                                // padding: EdgeInsets.only(left: 0, right: 10),
                                child: Text(
                              'Play flashcard',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => PlayFlashcard()));
                          },
                        ),
                        GestureDetector(
                          child: Container(
                            alignment: Alignment.center,
                            width: MediaQuery.of(context).size.width * 0.38,
                            height: 44,
                            margin: EdgeInsets.only(
                                right: MediaQuery.of(context).size.width * 0.1,
                                top: 50),
                            decoration: BoxDecoration(
                              color: Color(0xFFDAC5F8),
                              borderRadius: BorderRadius.circular(10),
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
                                // padding: EdgeInsets.only(left: 0, right: 10),
                                child: Text(
                              'Take the test',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                  fontSize: 14,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            )),
                          ),
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => FlashcardTest()));
                          },
                        ),
                      ],
                    ),
                    Container(
                      // height: MediaQuery.of(context).size.height * 0.38,
                      width: MediaQuery.of(context).size.width * 0.8,
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
                      margin: EdgeInsets.only(top: 50, bottom: 50),
                      padding: EdgeInsets.only(
                          left: 30, top: 30, bottom: 30, right: 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            // mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                child: Text(
                                  'Rating  7.8 / 10',
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Color(0xFF6C76C7),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(top: 10),
                                child: Text(
                                  'Rate & review this flashcard',
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Color(0xFF6C76C7),
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 10),
                            child: IconButton(
                                icon: Icon(
                                  // widget.fav ? Icons.favorite :
                                  Icons.navigate_next_rounded,
                                  size: 40,
                                  color: Color(0xFFCECECE),
                                ),
                                onPressed: () {}),
                          )
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
