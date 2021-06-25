import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rememable/widgets/bottom-nav-bar.dart';

class CreateFlashcard extends StatefulWidget {
  final int selectedTabIndex;
  final Function changeIndex;
  const CreateFlashcard({
    Key key,
    this.selectedTabIndex,
    this.changeIndex,
  }) : super(key: key);
  @override
  _CreateFlashcardState createState() => _CreateFlashcardState();
}

class _CreateFlashcardState extends State<CreateFlashcard>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
            color: Color(0xFFFAFAFA),
            child: Column(children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.12,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFF749BFF),
                child: Row(
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
                          'Create Flashcard',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 24.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                    ),
                    GestureDetector(
                      child: Container(
                        padding: EdgeInsets.only(top: 40.0, right: 10.0),
                        child: Text(
                          'Done',
                          style: GoogleFonts.montserrat(
                            textStyle: TextStyle(
                                color: Colors.white,
                                fontSize: 12.0,
                                fontWeight: FontWeight.w400),
                          ),
                        ),
                      ),
                      onTap: () {
                        Navigator.pop(context);
                      },
                    ),
                  ],
                ),
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.79,
                // color: Color(0xFFFAFAFA), //More grey
                color: Color(0xFFEBEBEB), //Fucking little grey
              ),
              Container(
                height: MediaQuery.of(context).size.height * 0.09,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border(
                      top: BorderSide(width: 1.0, color: Color(0xFFC7C7CC))),
                ),
                child: GestureDetector(
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height * 0.09,
                    padding: EdgeInsets.only(bottom: 20),
                    child: Icon(
                      Icons.add_circle_outline_rounded,
                      size: 25,
                      color: Color(0xFFBFBFBF),
                    ),
                  ),
                  onTap: () {
                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) => CreateFlashcard()));
                  },
                ),
              )
            ])));
  }
}
