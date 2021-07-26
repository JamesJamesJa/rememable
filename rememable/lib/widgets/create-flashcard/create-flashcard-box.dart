import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';

class CreateFlashcardBox extends StatefulWidget {
  final int index;
  final Function changeTerm;
  final Function changeDefinition;
  const CreateFlashcardBox({
    Key key,
    this.index,
    this.changeTerm,
    this.changeDefinition,
  }) : super(key: key);
  @override
  _CreateFlashcardBoxState createState() => _CreateFlashcardBoxState();
}

class _CreateFlashcardBoxState extends State<CreateFlashcardBox> {
  Widget build(BuildContext context) {
    TextEditingController termTemp;
    TextEditingController definitionTemp;
    return Container(
      child: Column(
        children: [
          Container(
            width: MediaQuery.of(context).size.width * 0.8,
            height: MediaQuery.of(context).size.height * 0.16,
            margin: EdgeInsets.only(top: 10, bottom: 10),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.withOpacity(0.5),
                  spreadRadius: 1,
                  blurRadius: 7,
                  offset: Offset(2, 3),
                ),
              ],
            ),
            child: Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color: Color(0xff646464),
                      width: 1.0,
                    ),
                  )),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextField(
                      controller: termTemp,
                      decoration: InputDecoration(
                        hintStyle: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Color(0xFFC5C5C5),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        contentPadding:
                            EdgeInsets.only(top: 20.0, left: 2, right: 2),
                        border: InputBorder.none,
                      ),
                      onEditingComplete: () {
                        print(termTemp.text);
                      },
                      onChanged: (String value) {},
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  margin: EdgeInsets.only(top: 2),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'TERM',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Color(0xFFA0A0A0),
                        fontSize: 8.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  decoration: BoxDecoration(
                      border: Border(
                    bottom: BorderSide(
                      color: Color(0xff646464),
                      width: 1.0,
                    ),
                  )),
                  child: Container(
                    width: MediaQuery.of(context).size.width * 0.7,
                    child: TextField(
                      controller: definitionTemp,
                      decoration: InputDecoration(
                        hintStyle: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                            color: Color(0xFFC5C5C5),
                            fontSize: 14.0,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                        contentPadding:
                            EdgeInsets.only(top: 20.0, left: 2, right: 2),
                        border: InputBorder.none,
                      ),
                      onChanged: (String value) {},
                    ),
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.7,
                  margin: EdgeInsets.only(top: 2),
                  alignment: Alignment.topLeft,
                  child: Text(
                    'DEFINITION',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                        color: Color(0xFFA0A0A0),
                        fontSize: 8.0,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
