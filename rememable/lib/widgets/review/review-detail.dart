import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rememable/providers/allFlashcard.dart';
import 'package:rememable/providers/authen.dart';
import 'package:rememable/screens/category.dart';
import 'package:smooth_star_rating/smooth_star_rating.dart';

class ReviewDetail extends StatefulWidget {
  final String flashcard_id;
  final String imagePath;
  final String flashcard_name;
  final String owner_name;
  final double rating;
  final int review_amount;
  final bool isReviewYet;
  final Function setLoading;
  const ReviewDetail({
    Key key,
    this.flashcard_id,
    this.flashcard_name,
    this.imagePath,
    this.owner_name,
    this.rating,
    this.review_amount,
    this.isReviewYet,
    this.setLoading,
  }) : super(key: key);
  @override
  _ReviewDetailState createState() => _ReviewDetailState();
}

class _ReviewDetailState extends State<ReviewDetail> {
  double ratingTemp = 0;
  TextEditingController reviewController = TextEditingController(text: '');
  @override
  void initState() {
    ratingTemp = 0;
    reviewController.text = '';
    super.initState();
  }

  Widget build(BuildContext context) {
    return Consumer2<AllFlashcard, Authen>(
        builder: (context, allFlashcard, user, child) {
      return Container(
        height: MediaQuery.of(context).size.height * 0.23,
        margin: EdgeInsets.only(
            left: MediaQuery.of(context).size.width * 0.1,
            right: MediaQuery.of(context).size.width * 0.1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              child: Row(
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
                              textAlign: TextAlign.left,
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
                                (widget.rating).toStringAsFixed(1),
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
                                      Icons.star_outlined,
                                      size: 22,
                                      color: Color(0xFFFFDA55),
                                    )
                                  : widget.rating >= index.toDouble() - 0.5
                                      ? Icon(
                                          Icons.star_half_outlined,
                                          size: 22,
                                          color: Color(0xFFFFDA55),
                                        )
                                      : Icon(
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
            Container(
              padding: EdgeInsets.only(bottom: 10, left: 6),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
                      setState(() {
                        reviewController.text = "";
                        ratingTemp = 0;
                      });
                      if (widget.isReviewYet) {
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
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                    )
                                  ],
                                ));
                      } else {
                        showDialog(
                            context: context,
                            builder: (context) {
                              return Material(
                                color: Colors.transparent,
                                child: Container(
                                  child: CupertinoAlertDialog(
                                    title: Text('Rate this flashcard!'),
                                    content: Container(
                                      padding: EdgeInsets.only(top: 20),
                                      height:
                                          MediaQuery.of(context).size.height *
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
                                              setState(() {
                                                ratingTemp = value;
                                              });
                                            },
                                          ),
                                          TextField(
                                            controller: reviewController,
                                            decoration: InputDecoration(
                                                labelText: "Review",
                                                contentPadding: EdgeInsets.only(
                                                    top: 10,
                                                    left: 4,
                                                    right: 4)),
                                          ),
                                        ],
                                      ),
                                    ),
                                    actions: [
                                      CupertinoDialogAction(
                                        child: Text('Cancel'),
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        },
                                      ),
                                      CupertinoDialogAction(
                                        child: Text('Submit'),
                                        onPressed: () {
                                          widget.setLoading(true);
                                          Navigator.of(context).pop();

                                          allFlashcard
                                              .addNewReview(
                                                  widget.flashcard_id,
                                                  ratingTemp.toInt(),
                                                  reviewController.text,
                                                  user.getName())
                                              .then((value) {
                                            widget.setLoading(false);
                                          });
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
    });
  }
}
