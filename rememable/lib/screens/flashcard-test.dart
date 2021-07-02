import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rememable/widgets/animation/show-up.dart';
import 'package:syncfusion_flutter_gauges/gauges.dart';
// import 'package:kelena/models/user.dart';
// import 'package:kelena/providers/student.dart';
// import 'package:kelena/screens/firstCome.dart';
// import 'package:kelena/screens/instructorTime.dart';
// import 'package:kelena/widgets/student/dialogAddSchedule.dart';
// import 'package:provider/provider.dart';

class FlashcardTest extends StatefulWidget {
  // final User teacher;
  // final String id, name, classNow;
  // final bool fav;
  // final int index;
  // final int selectedTabIndex;
  // final Function changeIndex;
  const FlashcardTest({
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
  _FlashcardTestState createState() => _FlashcardTestState();
}

class _FlashcardTestState extends State<FlashcardTest> {
  var answerController = TextEditingController();
  var answerControllerTemp = TextEditingController();
  var flashcardNumberController = ScrollController();
  int flashcardIndex = 0;
  int scorePoint = 0;
  double scorePercent = 0;
  double scrollPosition = 0;
  void setIndex(int value) {
    setState(() {
      flashcardIndex = value;
    });
    // print(flashcardIndex);
  }

  PageController pageController = PageController();

  Widget build(BuildContext context) {
    int flashcardLength = 3;
    // int flashcardLength = 10;

    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFFAFAFA),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.14,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF749BFF),
              child: Column(
                children: [
                  Stack(
                    // mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      Container(
                        height: MediaQuery.of(context).size.height * 0.11,
                        width: MediaQuery.of(context).size.width,
                        alignment: Alignment.centerLeft,
                        padding: EdgeInsets.only(top: 30.0, left: 10.0),
                        child: IconButton(
                            icon: Icon(
                              Icons.close,
                              size: 26,
                              color: Colors.white,
                            ),
                            onPressed: () {
                              Navigator.pop(context);
                            }),
                      ),
                      Center(
                        child: flashcardIndex == flashcardLength
                            ? Container(
                                margin: EdgeInsets.only(top: 70),
                                child: Text(
                                  'Test Result',
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Colors.white,
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                              )
                            : Container(
                                // width: MediaQuery.of(context).size.width,
                                width: flashcardLength < 8
                                    ? (flashcardLength * 20 +
                                            flashcardLength * 26) +
                                        0.0
                                    // MediaQuery.of(context).size.width
                                    : MediaQuery.of(context).size.width * 0.74,
                                margin: EdgeInsets.only(top: 70),
                                // alignment: Alignment.topCenter,
                                height: 26,
                                child: ListView.builder(
                                  // addAutomaticKeepAlives: true,
                                  // shrinkWrap: false,
                                  // reverse: true,
                                  // addSemanticIndexes: true,
                                  controller: flashcardNumberController,
                                  scrollDirection: Axis.horizontal,
                                  itemCount: flashcardLength,

                                  // controller: indexController,
                                  itemBuilder:
                                      (BuildContext context, int index) =>
                                          Container(
                                    width: 26,
                                    height: 26,
                                    margin:
                                        EdgeInsets.only(left: 10, right: 10),
                                    decoration: BoxDecoration(
                                      color: index == flashcardIndex
                                          ? Color(0xffFFAFCC)
                                          : index > flashcardIndex
                                              ? Color(0xffDADADA)
                                              : Color(0xffCBADF6),
                                      // : Color(0xffDAC5F8),
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
                      ),
                      // Container(
                      //   width: MediaQuery.of(context).size.width * 0.7,
                      //   padding: EdgeInsets.only(top: 40),
                      //   child: Center(
                      //     child: Text(
                      //       'Number Addition',
                      //       style: GoogleFonts.montserrat(
                      //         textStyle: TextStyle(
                      //             color: Colors.white,
                      //             fontSize: 24.0,
                      //             fontWeight: FontWeight.w400),
                      //       ),
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.84,
              width: MediaQuery.of(context).size.width,
              // padding: EdgeInsets.only(top: 10),
              child: flashcardIndex == flashcardLength
                  ? Column(children: [
                      Container(
                          width: MediaQuery.of(context).size.width,
                          height: 220,
                          margin: EdgeInsets.only(
                              top: MediaQuery.of(context).size.height * 0.18),
                          child: Stack(
                            children: [
                              SfRadialGauge(
                                axes: <RadialAxis>[
                                  RadialAxis(
                                    // labelFormat: "",
                                    showTicks: false,
                                    showLabels: false,
                                    startAngle: 150,
                                    endAngle: 30,
                                    axisLineStyle: AxisLineStyle(
                                        color: Color(0xffC4C4C4),
                                        thickness: 12),
                                    pointers: <GaugePointer>[
                                      RangePointer(
                                          value: scorePercent,
                                          width: 12,
                                          gradient: const SweepGradient(
                                              colors: <Color>[
                                                Color(0xFFCC2B5E),
                                                Color(0xFF753A88)
                                              ],
                                              stops: <double>[
                                                0.25,
                                                0.75
                                              ])),
                                    ],
                                  )
                                ],
                                enableLoadingAnimation: true,
                                animationDuration: 2000,
                              ),
                              Center(
                                child: ShowUp(
                                  delay: 1200,
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 80,
                                        width: 160,
                                        margin: EdgeInsets.only(top: 50),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Container(
                                              width: 10,
                                            ),
                                            Text(
                                              '${scorePercent.toInt().toString()}',
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  color: Color(0xFF6C76C7),
                                                  fontSize: 48.0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                            Container(
                                              padding: EdgeInsets.only(top: 12),
                                              child: Text('%',
                                                  // textAlign: TextAlign.end,
                                                  style: GoogleFonts.montserrat(
                                                      textStyle: TextStyle(
                                                    color: Color(0xFF6C76C7),
                                                    fontSize: 24.0,
                                                    fontWeight: FontWeight.w400,
                                                  ))),
                                            ),
                                          ],
                                        ),
                                      ),
                                      ShowUp(
                                        delay: 1300,
                                        child: Text('YOUR SCORE',
                                            // textAlign: TextAlign.end,
                                            style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                              color: Color(0xFF6C76C7),
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w400,
                                            ))),
                                      ),
                                    ],
                                  ),
                                ),
                              )
                            ],
                          )),
                      ShowUp(
                        delay: 1400,
                        child: Container(
                          margin: EdgeInsets.only(top: 30),
                          child: Text(
                              scorePercent < 40
                                  ? 'Keep studying!'
                                  : scorePercent < 80
                                      ? 'You have to try harder!'
                                      : scorePercent < 100
                                          ? 'Try a little more'
                                          : 'Congraturation!',
                              // textAlign: TextAlign.end,
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                color: Color(0xFF6C76C7),
                                fontSize: 24.0,
                                fontWeight: FontWeight.w400,
                              ))),
                        ),
                      ),
                      ShowUp(
                        delay: 1400,
                        child: Container(
                          margin: EdgeInsets.only(top: 20),
                          child: Text(
                              'You missed ${flashcardLength - scorePoint} out of ${flashcardLength} questions',
                              style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                color: Color(0xFF6C76C7),
                                fontSize: 18.0,
                                fontWeight: FontWeight.w400,
                              ))),
                        ),
                      ),
                      ShowUp(
                        delay: 1800,
                        child: GestureDetector(
                          child: Container(
                            width: MediaQuery.of(context).size.width * 0.65,
                            height: 50,
                            decoration: BoxDecoration(
                              color: Color(0xff6C76C7),
                              borderRadius: BorderRadius.circular(10),
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
                              top: 50,
                            ),
                            child: Center(
                              child: Text(
                                'Retake',
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontSize: 14.0,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                            ),
                          ),
                          onTap: () {
                            setState(() {
                              flashcardIndex = 0;
                              scorePercent = 0;
                              scorePoint = 0;
                            });
                          },
                        ),
                      ),
                    ])
                  : Column(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * 0.54,
                          child: PageView.builder(
                              itemCount: flashcardLength,
                              controller: pageController,
                              onPageChanged: (value) {
                                setIndex(value);
                              },
                              physics: new NeverScrollableScrollPhysics(),
                              itemBuilder: (context, index) {
                                return Column(
                                  children: [
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height:
                                          MediaQuery.of(context).size.width *
                                              0.8,
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
                                          top: MediaQuery.of(context)
                                                  .size
                                                  .height *
                                              0.12),
                                      padding: EdgeInsets.only(
                                          left: 30,
                                          top: 34,
                                          bottom: 34,
                                          right: 30),
                                      child: Center(
                                          child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.6,
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
                                      )),
                                    ),
                                  ],
                                );
                              }),
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              width: MediaQuery.of(context).size.width * 0.8,
                              decoration: BoxDecoration(
                                  border: Border(
                                bottom: BorderSide(
                                  color: Color(0xff646464),
                                  width: 1.0,
                                ),
                              )),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: [
                                  Container(
                                    width: answerControllerTemp.text == ""
                                        ? MediaQuery.of(context).size.width *
                                            0.66
                                        : MediaQuery.of(context).size.width *
                                            0.8,
                                    child: TextField(
                                      controller: answerController,
                                      decoration: InputDecoration(
                                        contentPadding: EdgeInsets.only(
                                            top: 30.0, left: 4, right: 4),
                                        border: InputBorder.none,
                                      ),
                                      onChanged: (String value) {
                                        setState(() {
                                          answerControllerTemp.text = value;
                                        });
                                      },
                                    ),
                                  ),
                                  answerControllerTemp.text == ""
                                      ? GestureDetector(
                                          child: Container(
                                            padding: EdgeInsets.only(bottom: 4),
                                            child: Text(
                                              'Don\'t know',
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                  color: Color(0xFF6C76C7),
                                                  fontSize: 9.0,
                                                  fontWeight: FontWeight.w400,
                                                ),
                                              ),
                                            ),
                                          ),
                                          onTap: () {
                                            setState(() {
                                              flashcardIndex++;
                                              answerControllerTemp.text = "";
                                              answerController.text = "";
                                              if (flashcardIndex > 3 &&
                                                  flashcardIndex + 3 <
                                                      flashcardLength) {
                                                flashcardNumberController
                                                    .jumpTo(scrollPosition);
                                                scrollPosition += 46;
                                                flashcardNumberController
                                                    .jumpTo(scrollPosition);
                                              } else {
                                                flashcardNumberController
                                                    .jumpTo(scrollPosition);
                                              }
                                            });
                                          })
                                      : Container()
                                ],
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 2),
                              child: Text(
                                'TYPE THE ANSWER',
                                style: GoogleFonts.montserrat(
                                  textStyle: TextStyle(
                                    color: Color(0xFFA0A0A0),
                                    fontSize: 7.0,
                                    fontWeight: FontWeight.w400,
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                        answerControllerTemp.text == ""
                            ? Container()
                            : GestureDetector(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.65,
                                  height: 50,
                                  decoration: BoxDecoration(
                                    color: Color(0xff6C76C7),
                                    borderRadius: BorderRadius.circular(10),
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
                                    top: 50,
                                  ),
                                  child: Center(
                                    child: Text(
                                      'Submit',
                                      style: GoogleFonts.montserrat(
                                        textStyle: TextStyle(
                                            color: Colors.white,
                                            fontSize: 14.0,
                                            fontWeight: FontWeight.w400),
                                      ),
                                    ),
                                  ),
                                ),
                                onTap: () {
                                  setState(() {
                                    flashcardIndex++;
                                    if (answerControllerTemp.text == "s") {
                                      scorePoint++;
                                    }
                                    scorePercent = scorePoint.toDouble() /
                                        flashcardLength.toDouble() *
                                        100;
                                    answerController.text = "";
                                    answerControllerTemp.text = "";
                                    if (flashcardIndex > 3 &&
                                        flashcardIndex + 3 < flashcardLength) {
                                      flashcardNumberController
                                          .jumpTo(scrollPosition);
                                      scrollPosition += 46;
                                      flashcardNumberController
                                          .jumpTo(scrollPosition);
                                    } else {
                                      flashcardNumberController
                                          .jumpTo(scrollPosition);
                                    }
                                  });
                                },
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
