import 'dart:math';

import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rememable/providers/allFlashcard.dart';
import 'package:rememable/providers/authen.dart';

class PlayFlashcard extends StatefulWidget {
  final String flashcard_id;
  const PlayFlashcard({
    Key key,
    this.flashcard_id,
  }) : super(key: key);
  @override
  _PlayFlashcardState createState() => _PlayFlashcardState();
}

class _PlayFlashcardState extends State<PlayFlashcard>
    with SingleTickerProviderStateMixin {
  int flashcardIndex = 0;
  void setIndex(int value) {
    setState(() {
      flashcardIndex = value;
    });
  }

  PageController pageController = PageController();
  AnimationController _animationController;
  Animation<double> _animation;
  AnimationStatus _animationStatus = AnimationStatus.dismissed;

  @override
  void initState() {
    super.initState();
    _animationController =
        AnimationController(vsync: this, duration: Duration(milliseconds: 200));
    _animation = Tween<double>(end: 1, begin: 0).animate(_animationController)
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        _animationStatus = status;
      });
  }

  Widget build(BuildContext context) {
    return Scaffold(body: Consumer2<AllFlashcard, Authen>(
        builder: (context, allFlashcard, user, child) {
      return Container(
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
                            '${allFlashcard.getNameById(widget.flashcard_id)}',
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
                    width: allFlashcard.getQuestionLength(widget.flashcard_id) <
                            10
                        ? (allFlashcard.getQuestionLength(widget.flashcard_id) *
                                    20 +
                                allFlashcard.getQuestionLength(
                                        widget.flashcard_id) *
                                    26) +
                            0.0
                        : MediaQuery.of(context).size.width,
                    height: 26,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount:
                          allFlashcard.getQuestionLength(widget.flashcard_id),
                      itemBuilder: (BuildContext context, int index) =>
                          Container(
                        width: 26,
                        height: 26,
                        margin: EdgeInsets.only(left: 10, right: 10),
                        decoration: BoxDecoration(
                          color: index == flashcardIndex
                              ? Color(0xffFFAFCC)
                              : index > flashcardIndex
                                  ? Color(0xffDADADA)
                                  : Color(0xffCBADF6),
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
              child: Stack(
                children: [
                  PageView.builder(
                      itemCount:
                          allFlashcard.getQuestionLength(widget.flashcard_id),
                      controller: pageController,
                      onPageChanged: (value) {
                        setIndex(value);
                        _animationController.reset();
                      },
                      itemBuilder: (context, index) {
                        return Column(
                          children: [
                            Transform(
                              transform: Matrix4.identity()
                                ..setEntry(3, 2, 0.002)
                                ..rotateY(pi * _animation.value),
                              alignment: FractionalOffset.center,
                              child: GestureDetector(
                                child: Container(
                                  width:
                                      MediaQuery.of(context).size.width * 0.8,
                                  height:
                                      MediaQuery.of(context).size.width * 0.8,
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
                                      top: MediaQuery.of(context).size.height *
                                          0.12),
                                  padding: EdgeInsets.only(
                                      left: 30, top: 34, bottom: 34, right: 30),
                                  child: Center(
                                    child: _animation.value < 0.5
                                        ? Container(
                                            width: MediaQuery.of(context)
                                                    .size
                                                    .width *
                                                0.6,
                                            child: Text(
                                              allFlashcard.getQuestionByIndex(
                                                  widget.flashcard_id, index),
                                              textAlign: TextAlign.center,
                                              style: GoogleFonts.montserrat(
                                                textStyle: TextStyle(
                                                    color: Color(0xFF6C76C7),
                                                    fontSize: 22.0,
                                                    fontWeight: FontWeight.w400,
                                                    height: 1.8),
                                              ),
                                            ),
                                          )
                                        : Transform(
                                            transform: Matrix4.identity()
                                              ..setEntry(3, 2, 0.001)
                                              ..rotateY(pi * _animation.value),
                                            alignment: FractionalOffset.center,
                                            child: Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.6,
                                              child: Text(
                                                allFlashcard.getAnswerByIndex(
                                                    widget.flashcard_id, index),
                                                textAlign: TextAlign.center,
                                                textDirection:
                                                    TextDirection.rtl,
                                                style: GoogleFonts.montserrat(
                                                  textStyle: TextStyle(
                                                      color: Color(0xFF6C76C7),
                                                      fontSize: 22.0,
                                                      fontWeight:
                                                          FontWeight.w400,
                                                      height: 1.8),
                                                ),
                                              ),
                                            ),
                                          ),
                                  ),
                                ),
                                onTap: () {
                                  if (_animationStatus ==
                                      AnimationStatus.dismissed) {
                                    _animationController.forward();
                                  } else {
                                    _animationController.reverse();
                                  }
                                },
                              ),
                            ),
                          ],
                        );
                      }),
                  Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        margin: EdgeInsets.only(
                            top: MediaQuery.of(context).size.height * 0.56,
                            left: MediaQuery.of(context).size.width * 0.15),
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
                                      if (flashcardIndex > 0) {
                                        setState(() {
                                          flashcardIndex--;
                                        });
                                        pageController.previousPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease);
                                      }
                                    }),
                              ),
                            ),
                            Text(
                              '${flashcardIndex + 1}/${allFlashcard.getQuestionLength(widget.flashcard_id)}',
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
                                      if (flashcardIndex + 1 <
                                          allFlashcard.getQuestionLength(
                                              widget.flashcard_id)) {
                                        setState(() {
                                          flashcardIndex++;
                                        });
                                        pageController.nextPage(
                                            duration:
                                                Duration(milliseconds: 300),
                                            curve: Curves.ease);
                                      }
                                    }),
                              ),
                            ),
                          ],
                        ),
                      ),
                      GestureDetector(
                        child: Container(
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
                          margin: EdgeInsets.only(
                              top: 50,
                              left: MediaQuery.of(context).size.width * 0.15),
                          child: Center(
                            child: Text(
                              _animationController.value < 0.5
                                  ? 'Tab this to see the definition'
                                  : 'Tab this to see the Term',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Color(0xFF6C76C7),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                        onTap: () {
                          if (_animationStatus == AnimationStatus.dismissed) {
                            _animationController.forward();
                          } else {
                            _animationController.reverse();
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    }));
  }
}
