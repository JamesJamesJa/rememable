import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:image_picker/image_picker.dart';
import 'package:rememable/widgets/flashcard-box.dart';
import 'package:dotted_border/dotted_border.dart';

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
  List<TextEditingController> termTemp = [];
  List<TextEditingController> term = [];
  List<TextEditingController> definition = [];
  List<TextEditingController> definitionTemp = [];
  var titleController = TextEditingController();
  var titleControllerTemp = TextEditingController();
  var descriptionController = TextEditingController();
  var descriptionControllerTemp = TextEditingController();

  String dropdownValue;
  int flashcardLength = 3;
  File imageFile;
  // Get image from gallery
  _getFromGallery() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.gallery,
    );
    // if (pickedFile != null) {
    setState(() {
      imageFile = File(pickedFile.path);
    });
    // }
  }

  // Get image from Camera
  _getFromCamera() async {
    PickedFile pickedFile = await ImagePicker().getImage(
      source: ImageSource.camera,
      maxWidth: 1800,
      maxHeight: 1800,
    );
    if (pickedFile != null) {
      setState(() {
        imageFile = File(pickedFile.path);
      });
    }
  }

  // @override
  // void initState() {
  //   for (var i = 0; i < flashcardLength; i++) {
  //     term.add(TextEditingController());
  //     termTemp.add(TextEditingController());
  //     definition.add(TextEditingController());
  //     definitionTemp.add(TextEditingController());
  //   }
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            height: MediaQuery.of(context).size.height,
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
                  color: Color(0xFFFEFEFE), //Fucking little grey
                  child: ListView.builder(
                      padding: EdgeInsets.only(top: 0),
                      scrollDirection: Axis.vertical,
                      itemCount: 1 + flashcardLength,
                      itemBuilder: (ctx, index) {
                        term.add(TextEditingController());
                        termTemp.add(TextEditingController());

                        definition.add(TextEditingController());
                        definitionTemp.add(TextEditingController());

                        return (index == 0)
                            ? Container(
                                height:
                                    MediaQuery.of(context).size.height * 0.44,
                                // color: Colors.white,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 120,
                                      height: 30,
                                      margin: EdgeInsets.only(
                                          bottom: 30,
                                          left: MediaQuery.of(context)
                                                  .size
                                                  .width *
                                              0.6),
                                      padding:
                                          EdgeInsets.only(left: 10, right: 10),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(6),
                                        border: Border.all(
                                            color: Color(0xFFD9D9D9),
                                            width: 1.0),
                                      ),
                                      child: DropdownButton<String>(
                                        value: dropdownValue,
                                        icon: Icon(
                                          Icons.keyboard_arrow_down_rounded,
                                          color: Color(0xFFAFA7A7),
                                        ),
                                        isExpanded: true,
                                        iconSize: 16,
                                        hint: Text(
                                          'Category',
                                          style: GoogleFonts.montserrat(
                                            textStyle: TextStyle(
                                                color: Color(0xFFAFA7A7),
                                                fontSize: 12.0,
                                                fontWeight: FontWeight.w400),
                                          ),
                                        ),
                                        style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                              color: Color(0xFF666666),
                                              fontSize: 12.0,
                                              fontWeight: FontWeight.w400),
                                        ),
                                        underline: Container(
                                          height: 0,
                                        ),
                                        onChanged: (String newValue) {
                                          setState(() {
                                            dropdownValue = newValue;
                                          });
                                        },
                                        items: <String>[
                                          'Math',
                                          'Science',
                                          'Language',
                                          'Coding'
                                        ].map<DropdownMenuItem<String>>(
                                            (String value) {
                                          return DropdownMenuItem<String>(
                                            value: value,
                                            child: Text(value),
                                          );
                                        }).toList(),
                                      ),
                                    ),
                                    // FDottedLine(
                                    //   color: Colors.lightBlue[600],
                                    //   height: 100.0,
                                    //   width: 50,
                                    //   strokeWidth: 2.0,
                                    //   dottedLength: 10.0,
                                    //   space: 2.0,
                                    //   child: ,
                                    // ),

                                    GestureDetector(
                                      child: imageFile == null
                                          ? Container(
                                              width: 160,
                                              height: 160,
                                              child: DottedBorder(
                                                color: Color(0xFFC5C5C5),
                                                dashPattern: [8, 4],
                                                radius: Radius.circular(6),
                                                borderType: BorderType.RRect,
                                                strokeWidth: 1,
                                                child: Center(
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Icon(
                                                        Icons.photo_rounded,
                                                        size: 18,
                                                        color:
                                                            Color(0xFFAEAEAE),
                                                      ),
                                                      Text(
                                                        'Add Cover',
                                                        style: GoogleFonts
                                                            .montserrat(
                                                          textStyle: TextStyle(
                                                              color: Color(
                                                                  0xFFC5C5C5),
                                                              fontSize: 12.0,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .w400),
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            )
                                          : Container(
                                              width: 160,
                                              height: 160,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(6)),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(6),
                                                child: Image.file(
                                                  imageFile,
                                                  width: 160,
                                                  height: 160,
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ),
                                      onTap: () {
                                        _getFromGallery();
                                      },
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      decoration: BoxDecoration(
                                          border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xff646464),
                                          width: 1.0,
                                        ),
                                      )),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        // margin: EdgeInsets.only(top: 20),
                                        child: TextField(
                                          controller: titleControllerTemp,
                                          decoration: InputDecoration(
                                            hintText: "Subject, chapter, unit",
                                            hintStyle: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                color: Color(0xFFC5C5C5),
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            contentPadding: EdgeInsets.only(
                                                top: 30.0, left: 2, right: 2),
                                            border: InputBorder.none,
                                          ),
                                          onChanged: (String value) {
                                            setState(() {
                                              titleController.text = value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      margin: EdgeInsets.only(top: 2),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'TITLE',
                                        style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            color: Color(0xFFA0A0A0),
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      decoration: BoxDecoration(
                                          border: Border(
                                        bottom: BorderSide(
                                          color: Color(0xff646464),
                                          width: 1.0,
                                        ),
                                      )),
                                      child: Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        child: TextField(
                                          controller: descriptionControllerTemp,
                                          decoration: InputDecoration(
                                            hintStyle: GoogleFonts.montserrat(
                                              textStyle: TextStyle(
                                                color: Color(0xFFC5C5C5),
                                                fontSize: 14.0,
                                                fontWeight: FontWeight.w400,
                                              ),
                                            ),
                                            contentPadding: EdgeInsets.only(
                                                top: 30.0, left: 2, right: 2),
                                            border: InputBorder.none,
                                          ),
                                          onChanged: (String value) {
                                            setState(() {
                                              descriptionController.text =
                                                  value;
                                            });
                                          },
                                        ),
                                      ),
                                    ),
                                    Container(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      margin: EdgeInsets.only(top: 2),
                                      alignment: Alignment.topLeft,
                                      child: Text(
                                        'DESCRIPTION',
                                        style: GoogleFonts.montserrat(
                                          textStyle: TextStyle(
                                            color: Color(0xFFA0A0A0),
                                            fontSize: 10.0,
                                            fontWeight: FontWeight.w400,
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              )
                            : Dismissible(
                                key: UniqueKey(),
                                direction: DismissDirection.endToStart,
                                onDismissed: (DismissDirection direction) {
                                  setState(() {
                                    flashcardLength--;
                                    term.removeAt(index - 1);
                                    termTemp.removeAt(index - 1);
                                    definition.removeAt(index - 1);
                                    definitionTemp.removeAt(index - 1);
                                  });
                                },
                                child: Container(
                                  child: Column(
                                    children: [
                                      Container(
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.8,
                                        height:
                                            MediaQuery.of(context).size.height *
                                                0.16,
                                        margin: EdgeInsets.only(
                                            top: 10, bottom: 10),
                                        decoration: BoxDecoration(
                                          color: Colors.white,
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          boxShadow: [
                                            BoxShadow(
                                              color:
                                                  Colors.grey.withOpacity(0.5),
                                              spreadRadius: 1,
                                              blurRadius: 7,
                                              offset: Offset(2, 3),
                                            ),
                                          ],
                                        ),
                                        child: Column(
                                          children: [
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.7,
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                bottom: BorderSide(
                                                  color: Color(0xff646464),
                                                  width: 1.0,
                                                ),
                                              )),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.7,
                                                child: TextField(
                                                  controller:
                                                      termTemp[index - 1],
                                                  decoration: InputDecoration(
                                                    hintStyle:
                                                        GoogleFonts.montserrat(
                                                      textStyle: TextStyle(
                                                        color:
                                                            Color(0xFFC5C5C5),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            top: 20.0,
                                                            left: 2,
                                                            right: 2),
                                                    border: InputBorder.none,
                                                  ),
                                                  onChanged: (String value) {
                                                    setState(() {
                                                      term[index - 1].text =
                                                          value;
                                                      // termTemp[index - 1]
                                                      //         .selection =
                                                      //     TextSelection.fromPosition(
                                                      //         TextPosition(
                                                      //             offset: termTemp[
                                                      //                     index - 1]
                                                      //                 .text
                                                      //                 .length));
                                                      // termTemp[index - 1].text =
                                                      //     value;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.7,
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
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.7,
                                              decoration: BoxDecoration(
                                                  border: Border(
                                                bottom: BorderSide(
                                                  color: Color(0xff646464),
                                                  width: 1.0,
                                                ),
                                              )),
                                              child: Container(
                                                width: MediaQuery.of(context)
                                                        .size
                                                        .width *
                                                    0.7,
                                                child: TextField(
                                                  controller:
                                                      definitionTemp[index - 1],
                                                  decoration: InputDecoration(
                                                    hintStyle:
                                                        GoogleFonts.montserrat(
                                                      textStyle: TextStyle(
                                                        color:
                                                            Color(0xFFC5C5C5),
                                                        fontSize: 14.0,
                                                        fontWeight:
                                                            FontWeight.w400,
                                                      ),
                                                    ),
                                                    contentPadding:
                                                        EdgeInsets.only(
                                                            top: 20.0,
                                                            left: 2,
                                                            right: 2),
                                                    border: InputBorder.none,
                                                  ),
                                                  onChanged: (String value) {
                                                    setState(() {
                                                      definition[index - 1]
                                                          .text = value;
                                                    });
                                                  },
                                                ),
                                              ),
                                            ),
                                            Container(
                                              width: MediaQuery.of(context)
                                                      .size
                                                      .width *
                                                  0.7,
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
                                )
                                // FlashcardBox()
                                );
                      })),
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
                    setState(() {
                      flashcardLength++;
                    });
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
