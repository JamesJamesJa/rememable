import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:rememable/models/flashcard.dart';
import 'package:rememable/providers/allFlashcard.dart';
import 'package:rememable/providers/authen.dart';
import 'package:provider/provider.dart';
import 'package:rememable/widgets/review/review-box.dart';
import 'package:rememable/widgets/review/review-detail.dart';

class Review extends StatefulWidget {
  final String flashcard_id;
  const Review({
    Key key,
    this.flashcard_id,
  }) : super(key: key);
  @override
  _ReviewState createState() => _ReviewState();
}

class _ReviewState extends State<Review> with SingleTickerProviderStateMixin {
  @override
  bool isLoading = false;
  void initState() {
    isLoading = false;

    super.initState();
  }

  Function setLoading(bool isLoadingTemp) {
    setState(() {
      isLoading = isLoadingTemp;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body: Consumer2<AllFlashcard, Authen>(
        builder: (context, allFlashcard, user, child) {
      return isLoading
          ? Center(
              child: LoadingBouncingGrid.square(
                borderColor: Color(0xff79EFA8),
                borderSize: 3.0,
                size: 100.0,
                backgroundColor: Color(0xff79EFA8),
                duration: Duration(milliseconds: 1200),
              ),
            )
          : Container(
              height: MediaQuery.of(context).size.height,
              color: Color(0xFFFAFAFA),
              child: Column(
                children: [
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
                              'Reviews',
                              style: GoogleFonts.montserrat(
                                textStyle: TextStyle(
                                    color: Colors.white,
                                    fontSize: 24.0,
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                          ),
                        ),
                        Container(
                          height: MediaQuery.of(context).size.height * 0.12,
                          width: MediaQuery.of(context).size.width * 0.15,
                          padding: EdgeInsets.only(top: 40.0, right: 10.0),
                          child: Icon(
                            Icons.more_horiz_rounded,
                            size: 26,
                            color: Color(0xFF749BFF),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.88,
                    child: Container(
                        color: Color(0xFFFAFAFA),
                        height: MediaQuery.of(context).size.height * 0.3,
                        width: MediaQuery.of(context).size.width,
                        child: ListView.builder(
                            padding: EdgeInsets.only(bottom: 30, top: 50),
                            scrollDirection: Axis.vertical,
                            itemBuilder: (ctx, index) => (index == 0)
                                ? ReviewDetail(
                                    flashcard_id: widget.flashcard_id,
                                    imagePath: allFlashcard.getImagePathById(
                                      widget.flashcard_id,
                                    ),
                                    flashcard_name: allFlashcard
                                        .getNameById(widget.flashcard_id),
                                    owner_name: allFlashcard
                                        .getOwnerNameById(widget.flashcard_id),
                                    rating: allFlashcard
                                        .getRatingById(widget.flashcard_id),
                                    review_amount:
                                        allFlashcard.getReviewAmountById(
                                            widget.flashcard_id),
                                    isReviewYet: allFlashcard.isReviewYet(
                                        widget.flashcard_id, user.getName()),
                                    setLoading: setLoading,
                                  )
                                : ReviewBox(
                                    name:
                                        allFlashcard.getOwnerReviewNameByIndex(
                                            widget.flashcard_id, index - 1),
                                    rating: allFlashcard.getRatingByIndex(
                                        widget.flashcard_id, index - 1),
                                    review: allFlashcard.getCommentByIndex(
                                        widget.flashcard_id, index - 1),
                                  ),
                            itemCount: 1 +
                                allFlashcard
                                    .getReviewLength(widget.flashcard_id))),
                  ),
                ],
              ),
            );
    }));
  }
}
