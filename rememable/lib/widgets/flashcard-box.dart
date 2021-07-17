import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:rememable/models/flashcard.dart';
import 'package:rememable/providers/allFlashcard.dart';
import 'package:rememable/providers/authen.dart';
import 'package:rememable/screens/flashcard-details.dart';
// import 'package:kelena/models/user.dart';
// import 'package:kelena/providers/student.dart';
// import 'package:kelena/screens/firstCome.dart';
// import 'package:kelena/screens/instructorTime.dart';
// import 'package:kelena/widgets/student/dialogAddSchedule.dart';
// import 'package:provider/provider.dart';

class FlashcardBox extends StatefulWidget {
  final String flashcard_id;
  // final User teacher;
  // final String id, name, classNow;
  // final bool fav;
  final int index;
  // final int selectedTabIndex;
  // final Function changeIndex;
  const FlashcardBox({
    Key key,
    this.flashcard_id,
    // this.teacher,
    // this.id,
    // this.name,
    // this.classNow,
    // this.fav,
    this.index,
    // this.selectedTabIndex,
    // this.changeIndex,
  }) : super(key: key);
  @override
  _FlashcardBoxState createState() => _FlashcardBoxState();
}

class _FlashcardBoxState extends State<FlashcardBox> {
  // List<Flashcard> allFlashcard = Provider.of<AllFlashcard>(context).flashcard;
  // var imageTemp = Image.network('');
  var delayTime = 0;
  @override
  void initState() {
    // Future.delayed(const Duration(milliseconds: 4000), () {
    //   setState(() {
    //     delayTime = 1;
    //   });
    // });
    super.initState();
  }

  // void dispose() {
  //   delayTime = 0;
  //   super.dispose();
  // }

  Widget build(BuildContext context) {
    return Consumer2<AllFlashcard, Authen>(
      builder: (context, allFlashcard, user, child) {
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
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 20.0, top: 0.0),
                          // child: Image.asset(
                          child: Image.network(
                            'https://rememable.herokuapp.com${allFlashcard.getImagePathById(widget.flashcard_id)}',
                            loadingBuilder: (BuildContext context, Widget child,
                                ImageChunkEvent loadingProgress) {
                              if (loadingProgress == null) {
                                return child;
                              }
                              return Center(
                                  child: Container(
                                height: 52,
                                width: 52,
                                color: Colors.white,
                                // margin: EdgeInsets.only(left: 18.0, top: 30.0),
                                child: SpinKitFadingCircle(
                                  color: Color(0xff749BFF),
                                  size: 40.0,
                                ),
                              ));
                            },
                            // 'https://rememable.herokuapp.com/uploads/flashcard_cover_2_bec06168c7.jpeg',
                            // 'images/flashcard-cover-2.jpeg',
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                        // delayTime == 0
                        // ? Container(
                        //     height: 52,
                        //     width: 52,
                        //     color: Colors.white,
                        //     margin: EdgeInsets.only(left: 18.0, top: 30.0),
                        //     child: SpinKitFadingCircle(
                        //       color: Color(0xff749BFF),
                        //       size: 40.0,
                        //     ),
                        //   )
                        //     : Container(),
                      ],
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
                              '${allFlashcard.getNameById(widget.flashcard_id)}',
                              // 'Number Addition2',
                              style: TextStyle(
                                  color: Color(0xFF6C76C7),
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14.0),
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.only(bottom: 2),
                            child: Text(
                              'By : ${allFlashcard.getOwnerNameById(widget.flashcard_id)}',
                              // 'By: Dr.Peil Foden',
                              style: TextStyle(
                                  color: Color(0xFF6C76C7),
                                  fontWeight: FontWeight.w200,
                                  fontSize: 12.0),
                            ),
                          ),
                          Container(
                            child: Text(
                              'Catagory : ${allFlashcard.getCategoryById(widget.flashcard_id)}',
                              // 'Catagory: Math',
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
                      margin: EdgeInsets.only(right: 0, left: 40),
                      width: 40.0,
                      height: 40,
                      // color: Colors.red,
                      child: IconButton(
                        icon: Icon(
                          user.isFav(widget.flashcard_id)
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          size: 24,
                          color: Color(0xFFFFAFCC),
                        ),
                        onPressed: () {
                          user.manageFav(widget.flashcard_id);
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
          // behavior: HitTestBehavior.translucent,
          onTap: () {
            // print(widget.flashcard_id);
            if (!user.isStudied(widget.flashcard_id)) {
              user.addStudied(widget.flashcard_id);
            }
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) =>
                        FlashcardDetails(flashcard_id: widget.flashcard_id)));
          },
        );
      },
    );
  }
}
