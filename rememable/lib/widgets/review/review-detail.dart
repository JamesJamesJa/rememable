import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rememable/screens/category.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';
// import 'package:kelena/models/user.dart';
// import 'package:kelena/providers/student.dart';
// import 'package:kelena/screens/firstCome.dart';
// import 'package:kelena/screens/instructorTime.dart';
// import 'package:kelena/widgets/student/dialogAddSchedule.dart';
// import 'package:provider/provider.dart';

class ReviewDetail extends StatefulWidget {
  final String imagePath;
  final String flashcard_name;
  final String owner_name;
  final double rating;
  final int review_amount;
  final bool isReviewYet;
  // final String id, name, classNow;
  // final bool fav;
  // final int index;
  // final int selectedTabIndex;
  // final Function changeIndex;
  const ReviewDetail({
    Key key,
    this.flashcard_name,
    this.imagePath,
    this.owner_name,
    this.rating,
    this.review_amount,
    this.isReviewYet,
  }) : super(key: key);
  @override
  _ReviewDetailState createState() => _ReviewDetailState();
}

class _ReviewDetailState extends State<ReviewDetail> {
  // var rating = 3;
  double ratingTemp = 0;
  @override
  void initState() {
    ratingTemp = 0;
    super.initState();
  }

  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.23,
      margin: EdgeInsets.only(
          left: MediaQuery.of(context).size.width * 0.1,
          right: MediaQuery.of(context).size.width * 0.1),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Container(
            // padding: EdgeInsets.only(bottom: 0),
            // height: MediaQuery.of(context).size.height * 0.1,
            child: Row(
              // mainAxisAlignment: MainAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(8),
                  child: Image.network(
                    'https://rememable.herokuapp.com${widget.imagePath}',
                    height: MediaQuery.of(context).size.width * 0.3,
                    width: MediaQuery.of(context).size.width * 0.3,
                    fit: BoxFit.cover,
                  ),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.43,
                  height: MediaQuery.of(context).size.width * 0.3,
                  margin: EdgeInsets.only(
                      left: MediaQuery.of(context).size.width * 0.07),
                  padding: EdgeInsets.only(top: 6, bottom: 6),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          Text(
                            "${widget.flashcard_name} Reviews",
                            maxLines: 3,
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Color(0xff323232),
                                  fontSize: 18.0,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          Container(
                            alignment: Alignment.centerLeft,
                            margin: EdgeInsets.only(top: 6),
                            child: Text(
                              widget.owner_name,
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Color(0xff6C76C7),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Container(
                            margin: EdgeInsets.only(right: 6),
                            child: Text(
                              // "3.2",
                              (widget.rating).toString(),
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Color(0xff323232),
                                    fontSize: 18.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                          for (int index = 1; index <= 5; index++)
                            widget.rating >= index.toDouble()
                                ? Icon(
                                    // widget.fav ? Icons.favorite :
                                    Icons.star_outlined,
                                    size: 22,
                                    color: Color(0xFFFFDA55),
                                  )
                                : widget.rating >= index.toDouble() - 0.5
                                    ? Icon(
                                        // widget.fav ? Icons.favorite :
                                        Icons.star_half_outlined,
                                        size: 22,
                                        color: Color(0xFFFFDA55),
                                      )
                                    : Icon(
                                        // widget.fav ? Icons.favorite :
                                        Icons.star_border_outlined,
                                        size: 22,
                                        color: Color(0xFFFFDA55),
                                      ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          // Container(
          //   // padding: EdgeInsets.only(top: 10),
          //   child: SingleChildScrollView(
          //     scrollDirection: Axis.horizontal,
          //     child: Row(
          //       children: [
          //         GestureDetector(
          //           child: Container(
          //             decoration: BoxDecoration(
          //               color: Colors.white,
          //               borderRadius: BorderRadius.circular(16),
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: Colors.grey.withOpacity(0.5),
          //                   spreadRadius: 1,
          //                   blurRadius: 7,
          //                   offset: Offset(2, 3),
          //                 ),
          //               ],
          //             ),
          //             margin: EdgeInsets.only(left: 40, top: 14, bottom: 10),
          //             child: Stack(
          //               children: [
          //                 ClipRRect(
          //                   borderRadius: BorderRadius.circular(16),
          //                   child: Image.asset(
          //                     'images/category-math-cover.jpeg',
          //                     height: 220,
          //                     width: 150,
          //                     fit: BoxFit.cover,
          //                   ),
          //                 ),
          //                 Container(
          //                   margin: EdgeInsets.only(top: 190, left: 20),
          //                   child: Text(
          //                     'Math',
          //                     style: GoogleFonts.montserrat(
          //                       textStyle: TextStyle(
          //                           color: Color(0xFF000000),
          //                           fontSize: 18.0,
          //                           fontWeight: FontWeight.w400),
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           onTap: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) => Category(
          //                           category: "Math",
          //                         )));
          //           },
          //         ),
          //         GestureDetector(
          //           child: Container(
          //             decoration: BoxDecoration(
          //               color: Colors.white,
          //               borderRadius: BorderRadius.circular(16),
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: Colors.grey.withOpacity(0.5),
          //                   spreadRadius: 1,
          //                   blurRadius: 7,
          //                   offset: Offset(2, 3),
          //                 ),
          //               ],
          //             ),
          //             margin: EdgeInsets.only(left: 30, top: 14, bottom: 10),
          //             child: Stack(
          //               children: [
          //                 ClipRRect(
          //                   borderRadius: BorderRadius.circular(16),
          //                   child: Image.asset(
          //                     'images/category-science-cover2.jpeg',
          //                     height: 220,
          //                     width: 150,
          //                     fit: BoxFit.cover,
          //                   ),
          //                 ),
          //                 Container(
          //                   margin: EdgeInsets.only(top: 190, left: 20),
          //                   child: Text(
          //                     'Science',
          //                     style: GoogleFonts.montserrat(
          //                       textStyle: TextStyle(
          //                           color: Color(0xFF000000),
          //                           fontSize: 18.0,
          //                           fontWeight: FontWeight.w400),
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           onTap: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) => Category(
          //                           category: "Science",
          //                         )));
          //           },
          //         ),
          //         GestureDetector(
          //           child: Container(
          //             decoration: BoxDecoration(
          //               color: Colors.white,
          //               borderRadius: BorderRadius.circular(16),
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: Colors.grey.withOpacity(0.5),
          //                   spreadRadius: 1,
          //                   blurRadius: 7,
          //                   offset: Offset(2, 3),
          //                 ),
          //               ],
          //             ),
          //             margin: EdgeInsets.only(left: 30, top: 14, bottom: 10),
          //             child: Stack(
          //               children: [
          //                 ClipRRect(
          //                   borderRadius: BorderRadius.circular(16),
          //                   child: Image.asset(
          //                     'images/category-language-cover.jpeg',
          //                     height: 220,
          //                     width: 150,
          //                     fit: BoxFit.cover,
          //                   ),
          //                 ),
          //                 Container(
          //                   margin: EdgeInsets.only(top: 190, left: 20),
          //                   child: Text(
          //                     'Language',
          //                     style: GoogleFonts.montserrat(
          //                       textStyle: TextStyle(
          //                           color: Color(0xFF000000),
          //                           fontSize: 18.0,
          //                           fontWeight: FontWeight.w400),
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           onTap: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) => Category(
          //                           category: "Language",
          //                         )));
          //           },
          //         ),
          //         GestureDetector(
          //           child: Container(
          //             decoration: BoxDecoration(
          //               color: Colors.white,
          //               borderRadius: BorderRadius.circular(16),
          //               boxShadow: [
          //                 BoxShadow(
          //                   color: Colors.grey.withOpacity(0.5),
          //                   spreadRadius: 1,
          //                   blurRadius: 7,
          //                   offset: Offset(2, 3),
          //                 ),
          //               ],
          //             ),
          //             margin: EdgeInsets.only(
          //                 left: 30, top: 14, bottom: 10, right: 40),
          //             child: Stack(
          //               children: [
          //                 ClipRRect(
          //                   borderRadius: BorderRadius.circular(16),
          //                   child: Image.asset(
          //                     'images/category-coding-cover.jpeg',
          //                     height: 220,
          //                     width: 150,
          //                     fit: BoxFit.cover,
          //                   ),
          //                 ),
          //                 Container(
          //                   margin: EdgeInsets.only(top: 190, left: 20),
          //                   child: Text(
          //                     'Coding',
          //                     style: GoogleFonts.montserrat(
          //                       textStyle: TextStyle(
          //                           color: Color(0xFF000000),
          //                           fontSize: 18.0,
          //                           fontWeight: FontWeight.w400),
          //                     ),
          //                   ),
          //                 ),
          //               ],
          //             ),
          //           ),
          //           onTap: () {
          //             Navigator.push(
          //                 context,
          //                 MaterialPageRoute(
          //                     builder: (context) => Category(
          //                           category: "Coding",
          //                         )));
          //           },
          //         ),
          //       ],
          //     ),
          //   ),
          // ),
          Container(
            padding: EdgeInsets.only(bottom: 10, left: 6),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              // crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  child: Text(
                    'All Reviews (${widget.review_amount})',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Color(0xFF323232),
                          fontSize: 18.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    if (!widget.isReviewYet) {
                      showDialog(
                          context: context,
                          builder: (_) => CupertinoAlertDialog(
                                title: Text(
                                  'You already rate and review this flashcard!',
                                  style: GoogleFonts.montserrat(
                                    textStyle: TextStyle(
                                        color: Color(0xFF323232),
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                actions: [
                                  CupertinoDialogAction(
                                    child: Text('OK'),
                                    // isDefaultAction: true,
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                  )
                                ],
                              ));
                    } else {
                      showDialog(
                          // barrierDismissible: true,
                          context: context,
                          builder: (context) {
                            return Material(
                              color: Colors.transparent,
                              child: Container(
                                child: CupertinoAlertDialog(
                                  title: Text('Rate this flashcard!'),
                                  content: Container(
                                    padding: EdgeInsets.only(top: 20),
                                    height: MediaQuery.of(context).size.height *
                                        0.12,
                                    child: Column(
                                      children: [
                                        SmoothStarRating(
                                          rating: ratingTemp,
                                          isReadOnly: false,
                                          size: 30,
                                          filledIconData: Icons.star,
                                          halfFilledIconData: Icons.star_half,
                                          defaultIconData: Icons.star_border,
                                          starCount: 5,
                                          allowHalfRating: false,
                                          spacing: 2.0,
                                          onRated: (value) {
                                            // print("rating value -> $value");
                                            // print("rating value dd -> ${value.truncate()}");
                                          },
                                        ),
                                        TextField(
                                          decoration: InputDecoration(
                                              labelText: "Review",
                                              contentPadding: EdgeInsets.only(
                                                  top: 10, left: 4, right: 4)
                                              // filled: true,
                                              // fillColor: Colors.grey.shade200
                                              ),
                                        ),
                                        // Container(
                                        //   width:
                                        //       MediaQuery.of(context).size.width * 0.4,
                                        //   height: 20,
                                        //   child:
                                        // ),
                                      ],
                                    ),
                                  ),
                                  actions: [
                                    CupertinoDialogAction(
                                      child: Text('Cancel'),
                                      // isDefaultAction: true,
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    ),
                                    CupertinoDialogAction(
                                      child: Text('Submit'),
                                      // isDefaultAction: true,
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    }
                  },
                  child: Container(
                    padding: EdgeInsets.only(right: 10),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            'WRITE A REVIEW',
                            style: GoogleFonts.montserrat(
                              textStyle: TextStyle(
                                  color: Color(0xFF323232),
                                  fontSize: 10.0,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(left: 6),
                          child: Icon(
                            Icons.edit,
                            size: 20,
                            color: Color(0xFF000000),
                          ),
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
    // GestureDetector(
    //   child: Center(
    //     child: Container(
    //       width: MediaQuery.of(context).size.width * 0.8,
    //       height: MediaQuery.of(context).size.height * 0.12,
    //       margin: EdgeInsets.only(top: 20.0),
    //       decoration: BoxDecoration(
    //         color: Colors.white,
    //         borderRadius: BorderRadius.circular(10),
    //         boxShadow: [
    //           BoxShadow(
    //             color: Colors.grey.withOpacity(0.5),
    //             spreadRadius: 2,
    //             blurRadius: 7,
    //             offset: Offset(2, 3),
    //           ),
    //         ],
    //       ),
    //       // decoration: BoxDecoration(
    //       //   border: Border(
    //       //     bottom: BorderSide(
    //       //       color: Color(0xff67676C),
    //       //       width: 0.2,
    //       //     ),
    //       //   ),
    //       // ),
    //       child: Container(
    //         child: Row(
    //           crossAxisAlignment: CrossAxisAlignment.center,
    //           children: [
    //             Container(
    //               padding: EdgeInsets.only(left: 20.0, top: 0.0),
    //               child: Image.asset(
    //                 'images/flashcard-cover-1.png',
    //                 height: 50,
    //                 width: 50,
    //               ),
    //             ),
    //             Container(
    //               width: MediaQuery.of(context).size.width * 0.4,
    //               // height: MediaQuery.of(context).size.height,
    //               padding: EdgeInsets.only(left: 20.0, top: 0),
    //               child: Column(
    //                 mainAxisAlignment: MainAxisAlignment.center,
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   Container(
    //                     padding: EdgeInsets.only(bottom: 3),
    //                     child: Text(
    //                       // widget.name,
    //                       'Number Addition',
    //                       style: TextStyle(
    //                           color: Color(0xFF6C76C7),
    //                           fontWeight: FontWeight.w500,
    //                           fontSize: 14.0),
    //                     ),
    //                   ),
    //                   Container(
    //                     padding: EdgeInsets.only(bottom: 2),
    //                     child: Text(
    //                       // widget.name,
    //                       'By: Dr.Peil Foden',
    //                       style: TextStyle(
    //                           color: Color(0xFF6C76C7),
    //                           fontWeight: FontWeight.w200,
    //                           fontSize: 12.0),
    //                     ),
    //                   ),
    //                   Container(
    //                     child: Text(
    //                       // widget.name,
    //                       'Catagory: Math',
    //                       style: TextStyle(
    //                           color: Color(0xFF6C76C7),
    //                           fontWeight: FontWeight.w200,
    //                           fontSize: 12.0),
    //                     ),
    //                   ),
    //                   // Align(
    //                   //   alignment: Alignment.centerLeft,
    //                   //   child: Text(
    //                   //     "No Class...",
    //                   //     style: TextStyle(
    //                   //         color: Color(0xff666666),
    //                   //         fontWeight: FontWeight.w100,
    //                   //         fontSize: 10.0),
    //                   //   ),
    //                   // ),
    //                   // Align(
    //                   //   alignment: Alignment.centerLeft,
    //                   //   child: Text(
    //                   //     "No Class...",
    //                   //     style: TextStyle(
    //                   //         color: Color(0xff666666),
    //                   //         fontWeight: FontWeight.w100,
    //                   //         fontSize: 10.0),
    //                   //   ),
    //                   // ),
    //                 ],
    //               ),
    //             ),
    //             // Consumer<Student>(builder: (context, student, child) {
    //             //   return
    //             Container(
    //               padding: EdgeInsets.only(right: 0, left: 40),
    //               width: 40.0,
    //               child: IconButton(
    //                 icon: Icon(
    //                   // widget.fav ? Icons.favorite :
    //                   Icons.favorite_outline,
    //                   size: 24,
    //                   color: Color(0xFFFFAFCC),
    //                 ),
    //                 onPressed: () {
    //                   // student.manageFav(widget.id);
    //                 },
    //               ),
    //             ),
    //             // ;}),
    //           ],
    //         ),
    //       ),
    //     ),
    //   ),
    //   onTap: () {
    //     // Navigator.push(
    //     //     context,
    //     //     MaterialPageRoute(
    //     //         builder: (context) => InstructTime(
    //     //               selectedTabIndex: widget.selectedTabIndex,
    //     //               changeIndex: widget.changeIndex,
    //     //               name: widget.name,
    //     //               id: widget.id,
    //     //               index: widget.index,
    //     //             )));
    //   },
    // );
  }
}
