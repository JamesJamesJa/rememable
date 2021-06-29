import 'package:flutter/material.dart';
import 'package:rememable/screens/flashcard-details.dart';
// import 'package:kelena/models/user.dart';
// import 'package:kelena/providers/student.dart';
// import 'package:kelena/screens/firstCome.dart';
// import 'package:kelena/screens/instructorTime.dart';
// import 'package:kelena/widgets/student/dialogAddSchedule.dart';
// import 'package:provider/provider.dart';

class FlashcardBox extends StatefulWidget {
  // final User teacher;
  // final String id, name, classNow;
  // final bool fav;
  // final int index;
  // final int selectedTabIndex;
  // final Function changeIndex;
  const FlashcardBox({
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
  _FlashcardBoxState createState() => _FlashcardBoxState();
}

class _FlashcardBoxState extends State<FlashcardBox> {
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Center(
        child: Container(
          width: MediaQuery.of(context).size.width * 0.8,
          height: MediaQuery.of(context).size.height * 0.12,
          margin: EdgeInsets.only(top: 20.0),
          decoration: BoxDecoration(
            color: Colors.white,
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
          // decoration: BoxDecoration(
          //   border: Border(
          //     bottom: BorderSide(
          //       color: Color(0xff67676C),
          //       width: 0.2,
          //     ),
          //   ),
          // ),
          child: Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  padding: EdgeInsets.only(left: 20.0, top: 0.0),
                  child: Image.asset(
                    'images/flashcard-cover-2.jpeg',
                    height: 50,
                    width: 50,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.4,
                  // height: MediaQuery.of(context).size.height,
                  padding: EdgeInsets.only(left: 20.0, top: 0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        padding: EdgeInsets.only(bottom: 3),
                        child: Text(
                          // widget.name,
                          'Number Addition',
                          style: TextStyle(
                              color: Color(0xFF6C76C7),
                              fontWeight: FontWeight.w500,
                              fontSize: 14.0),
                        ),
                      ),
                      Container(
                        padding: EdgeInsets.only(bottom: 2),
                        child: Text(
                          // widget.name,
                          'By: Dr.Peil Foden',
                          style: TextStyle(
                              color: Color(0xFF6C76C7),
                              fontWeight: FontWeight.w200,
                              fontSize: 12.0),
                        ),
                      ),
                      Container(
                        child: Text(
                          // widget.name,
                          'Catagory: Math',
                          style: TextStyle(
                              color: Color(0xFF6C76C7),
                              fontWeight: FontWeight.w200,
                              fontSize: 12.0),
                        ),
                      ),
                      // Align(
                      //   alignment: Alignment.centerLeft,
                      //   child: Text(
                      //     "No Class...",
                      //     style: TextStyle(
                      //         color: Color(0xff666666),
                      //         fontWeight: FontWeight.w100,
                      //         fontSize: 10.0),
                      //   ),
                      // ),
                      // Align(
                      //   alignment: Alignment.centerLeft,
                      //   child: Text(
                      //     "No Class...",
                      //     style: TextStyle(
                      //         color: Color(0xff666666),
                      //         fontWeight: FontWeight.w100,
                      //         fontSize: 10.0),
                      //   ),
                      // ),
                    ],
                  ),
                ),
                // Consumer<Student>(builder: (context, student, child) {
                //   return
                Container(
                  padding: EdgeInsets.only(right: 0, left: 40),
                  width: 40.0,
                  child: IconButton(
                    icon: Icon(
                      // widget.fav ? Icons.favorite :
                      Icons.favorite_outline,
                      size: 24,
                      color: Color(0xFFFFAFCC),
                    ),
                    onPressed: () {
                      // student.manageFav(widget.id);
                    },
                  ),
                ),
                // ;}),
              ],
            ),
          ),
        ),
      ),
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(builder: (context) => FlashcardDetails()
                // InstructTime(
                //       selectedTabIndex: widget.selectedTabIndex,
                //       changeIndex: widget.changeIndex,
                //       name: widget.name,
                //       id: widget.id,
                //       index: widget.index,
                //     )
                ));
      },
    );
  }
}
