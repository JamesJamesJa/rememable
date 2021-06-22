import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
// import 'package:kelena/models/user.dart';
// import 'package:kelena/providers/student.dart';
// import 'package:kelena/screens/firstCome.dart';
// import 'package:kelena/screens/instructorTime.dart';
// import 'package:kelena/widgets/student/dialogAddSchedule.dart';
// import 'package:provider/provider.dart';

class PlayFlashcard extends StatefulWidget {
  // final User teacher;
  // final String id, name, classNow;
  // final bool fav;
  // final int index;
  // final int selectedTabIndex;
  // final Function changeIndex;
  const PlayFlashcard({
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
  _PlayFlashcardState createState() => _PlayFlashcardState();
}

class _PlayFlashcardState extends State<PlayFlashcard> {
  Widget build(BuildContext context) {
    int flashcardLength = 6;
    // int flashcardLength = 20;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFFAFAFA),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.16,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF749BFF),
              child: Column(
                children: [
                  Row(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.11,
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
                    ],
                  ),
                  Container(
                    // width: MediaQuery.of(context).size.width,
                    width: flashcardLength < 10
                        ? (flashcardLength * 20 + flashcardLength * 26) + 0.0
                        : MediaQuery.of(context).size.width,
                    height: 26,
                    child: ListView.builder(
                      // shrinkWrap: true,
                      // addSemanticIndexes: false,
                      scrollDirection: Axis.horizontal,
                      itemCount: flashcardLength,
                      itemBuilder: (BuildContext context, int index) =>
                          Container(
                        width: 26,
                        height: 26,
                        margin: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: index == 4
                              ? Color(0xffFFAFCC)
                              : index > 4
                                  ? Color(0xffDADADA)
                                  : Color(0xffDAC5F8),
                          borderRadius: BorderRadius.circular(100),
                        ),
                        child: Center(
                            child: Text(
                          (index + 1).toString(),
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400),
                          ),
                        )),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.84,
              // padding: EdgeInsets.only(top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    // height: MediaQuery.of(context).size.height * 0.38,
                    width: MediaQuery.of(context).size.width * 0.8,
                    height: MediaQuery.of(context).size.width * 0.8,
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
                    child: Center(
                      child: Container(
                        // color: Colors.red,
                        width: MediaQuery.of(context).size.width * 0.6,
                        child: Text(
                          'What is the value of\n36 + 96 ?',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Color(0xFF6C76C7),
                                fontSize: 22.0,
                                fontWeight: FontWeight.w400,
                                height: 1.8),
                          ),
                        ),
                      ),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    margin: EdgeInsets.only(top: 50),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: Offset(2, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: IconButton(
                                icon: Icon(
                                  Icons.arrow_back_ios_rounded,
                                  size: 18,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  // Navigator.pop(context);
                                }),
                          ),
                        ),
                        Text(
                          '4/5',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Color(0xFF6C76C7),
                                fontSize: 20.0,
                                fontWeight: FontWeight.w700,
                                height: 1.8),
                          ),
                        ),
                        Container(
                          height: 50,
                          width: 50,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(100),
                            boxShadow: [
                              BoxShadow(
                                color: Colors.grey.withOpacity(0.5),
                                spreadRadius: 1,
                                blurRadius: 7,
                                offset: Offset(2, 3),
                              ),
                            ],
                          ),
                          child: Center(
                            child: IconButton(
                                icon: Icon(
                                  Icons.arrow_forward_ios_rounded,
                                  size: 18,
                                  color: Colors.black,
                                ),
                                onPressed: () {
                                  // Navigator.pop(context);
                                }),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     GestureDetector(
                  //       child: Container(
                  //         alignment: Alignment.center,
                  //         width: MediaQuery.of(context).size.width * 0.38,
                  //         height: 44,
                  //         margin: EdgeInsets.only(
                  //             left: MediaQuery.of(context).size.width * 0.1,
                  //             top: 50),
                  //         decoration: BoxDecoration(
                  //           color: Color(0xFFB0C4F7),
                  //           borderRadius: BorderRadius.circular(10),
                  //           boxShadow: [
                  //             BoxShadow(
                  //               color: Colors.grey.withOpacity(0.5),
                  //               spreadRadius: 2,
                  //               blurRadius: 7,
                  //               offset: Offset(2, 3),
                  //             ),
                  //           ],
                  //         ),
                  //         child: Container(
                  //             // padding: EdgeInsets.only(left: 0, right: 10),
                  //             child: Text(
                  //           'Play flashcard',
                  //           style: GoogleFonts.montserrat(
                  //             textStyle: TextStyle(
                  //               fontSize: 14,
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.w400,
                  //             ),
                  //           ),
                  //         )),
                  //       ),
                  //       onTap: () {
                  //         // Navigator.pushReplacement(context,
                  //         //     MaterialPageRoute(builder: (context) => PreHome()));
                  //       },
                  //     ),
                  //     GestureDetector(
                  //       child: Container(
                  //         alignment: Alignment.center,
                  //         width: MediaQuery.of(context).size.width * 0.38,
                  //         height: 44,
                  //         margin: EdgeInsets.only(
                  //             right: MediaQuery.of(context).size.width * 0.1,
                  //             top: 50),
                  //         decoration: BoxDecoration(
                  //           color: Color(0xFFDAC5F8),
                  //           borderRadius: BorderRadius.circular(10),
                  //           boxShadow: [
                  //             BoxShadow(
                  //               color: Colors.grey.withOpacity(0.5),
                  //               spreadRadius: 2,
                  //               blurRadius: 7,
                  //               offset: Offset(2, 3),
                  //             ),
                  //           ],
                  //         ),
                  //         child: Container(
                  //             // padding: EdgeInsets.only(left: 0, right: 10),
                  //             child: Text(
                  //           'Take the test',
                  //           style: GoogleFonts.montserrat(
                  //             textStyle: TextStyle(
                  //               fontSize: 14,
                  //               color: Colors.white,
                  //               fontWeight: FontWeight.w400,
                  //             ),
                  //           ),
                  //         )),
                  //       ),
                  //       onTap: () {
                  //         // Navigator.pushReplacement(context,
                  //         //     MaterialPageRoute(builder: (context) => PreHome()));
                  //       },
                  //     ),
                  //   ],
                  // ),
                  Container(
                    // height: MediaQuery.of(context).size.height * 0.38,
                    width: MediaQuery.of(context).size.width * 0.7,
                    height: 50,
                    decoration: BoxDecoration(
                      color: Color(0xffFFC8DD),
                      borderRadius: BorderRadius.circular(100),
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
                    // padding: EdgeInsets.only(top: 10, bottom: 10),
                    child: Center(
                      child: Text(
                        'Tab this to see the definition',
                        style: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              color: Color(0xFF6C76C7),
                              fontSize: 14.0,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
