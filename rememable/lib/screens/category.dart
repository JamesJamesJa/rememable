import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rememable/models/flashcard.dart';
import 'package:rememable/providers/allFlashcard.dart';
import 'package:rememable/widgets/bottom-nav-bar.dart';
import 'package:rememable/widgets/flashcard-box.dart';
import 'package:rememable/widgets/home-screen-widget/flashcard-category.dart';

class Category extends StatefulWidget {
  final String category;
  // final int selectedTabIndex;
  // final Function changeIndex;
  const Category({
    Key key,
    this.category,
    // this.selectedTabIndex,
    // this.changeIndex,
  }) : super(key: key);
  @override
  _CategoryState createState() => _CategoryState();
}

class _CategoryState extends State<Category>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    List<Flashcard> allFlashcard = Provider.of<AllFlashcard>(context).flashcard;
    return Scaffold(
        body: Consumer<AllFlashcard>(builder: (context, allFlashcard, child) {
      return Container(
        height: MediaQuery.of(context).size.height,
        color: Color(0xFFFAFAFA),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF749BFF),
              child: Stack(
                children: [
                  Center(
                    child: Container(
                      padding: EdgeInsets.only(top: 40),
                      child: Text(
                        widget.category,
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
                    height: MediaQuery.of(context).size.height * 0.11,
                    width: MediaQuery.of(context).size.width,
                    alignment: Alignment.centerLeft,
                    padding: EdgeInsets.only(top: 40.0, left: 10.0),
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
                    padding: EdgeInsets.only(top: 20),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (ctx, index) =>
                        allFlashcard.getCategoryByIndex(index) ==
                                widget.category
                            ? FlashcardBox(
                                flashcard_id: allFlashcard.getId(index),
                                index: index,
                              )
                            : Container(),
                    itemCount: allFlashcard.getLength(),
                  )),
              // SingleChildScrollView(
              //   scrollDirection: Axis.vertical,
              //   child: Column(
              //     children: [
              //       Image.network(
              //           'https://flutter-examples.com/wp-content/uploads/2019/09/blossom.jpg',
              //           width: 300,
              //           height: 200,
              //           fit: BoxFit.contain),
              //       Image.network(
              //           'https://flutter-examples.com/wp-content/uploads/2019/09/sample_img.png',
              //           width: 200,
              //           fit: BoxFit.contain),
              //       Text('Some Sample Text - 1',
              //           style: TextStyle(fontSize: 28)),
              //       Image.network(
              //           'https://flutter-examples.com/wp-content/uploads/2019/09/blossom.jpg',
              //           width: 300,
              //           height: 200,
              //           fit: BoxFit.contain),
              //       Container(
              //           height: MediaQuery.of(context).size.height * 0.3,
              //           width: MediaQuery.of(context).size.width,
              //           child: ListView.builder(
              //             // scrollDirection: Axis.vertical,
              //             itemBuilder: (ctx, index) => FlashcardBox(),
              //             itemCount: 10,
              //           )),
              //     ],
              //   ),
              // ),
            ),
          ],
        ),
      );
    }));
  }
}
