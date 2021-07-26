import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';
import 'package:rememable/models/flashcard.dart';
import 'package:rememable/providers/allFlashcard.dart';
import 'package:rememable/providers/authen.dart';
import 'package:rememable/screens/flashcard-details.dart';

class FlashcardBox extends StatefulWidget {
  final String flashcard_id;
  final int index;
  const FlashcardBox({
    Key key,
    this.flashcard_id,
    this.index,
  }) : super(key: key);
  @override
  _FlashcardBoxState createState() => _FlashcardBoxState();
}

class _FlashcardBoxState extends State<FlashcardBox> {
  var delayTime = 0;
  @override
  void initState() {
    super.initState();
  }

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
              child: Container(
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Stack(
                      children: [
                        Container(
                          alignment: Alignment.center,
                          padding: EdgeInsets.only(left: 20.0, top: 0.0),
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
                                child: SpinKitFadingCircle(
                                  color: Color(0xff749BFF),
                                  size: 40.0,
                                ),
                              ));
                            },
                            height: 50,
                            width: 50,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.4,
                      padding: EdgeInsets.only(left: 20.0, top: 0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.only(bottom: 3),
                            child: Text(
                              '${allFlashcard.getNameById(widget.flashcard_id)}',
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
                              style: TextStyle(
                                  color: Color(0xFF6C76C7),
                                  fontWeight: FontWeight.w200,
                                  fontSize: 12.0),
                            ),
                          ),
                          Container(
                            child: Text(
                              'Catagory : ${allFlashcard.getCategoryById(widget.flashcard_id)}',
                              style: TextStyle(
                                  color: Color(0xFF6C76C7),
                                  fontWeight: FontWeight.w200,
                                  fontSize: 12.0),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(right: 0, left: 40),
                      width: 40.0,
                      height: 40,
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
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          onTap: () {
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
