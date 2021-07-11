import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rememable/models/flashcard.dart';
import 'package:rememable/providers/allFlashcard.dart';
import 'package:rememable/widgets/bottom-nav-bar.dart';
import 'package:rememable/widgets/flashcard-box.dart';
import 'package:rememable/widgets/home-screen-widget/flashcard-category.dart';
import 'package:provider/provider.dart';

class Home extends StatefulWidget {
  final int selectedTabIndex;
  final Function changeIndex;
  const Home({
    Key key,
    this.selectedTabIndex,
    this.changeIndex,
  }) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> with SingleTickerProviderStateMixin {
  // @override
  // void initState() {
  //   Provider.of<AllFlashcard>(context, listen: false)
  //       .flashcardDetails()
  //       .then((_) {});
  //   super.initState();
  // }

  @override
  Widget build(BuildContext context) {
    List<Flashcard> allFlashcard = Provider.of<AllFlashcard>(context).flashcard;
    return Scaffold(
      body: Container(
        height: MediaQuery.of(context).size.height * 0.91,
        color: Color(0xFFFAFAFA),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.12,
              width: MediaQuery.of(context).size.width,
              color: Color(0xFF749BFF),
              child: Center(
                child: Container(
                  padding: EdgeInsets.only(top: 40),
                  child: Text(
                    'Home',
                    style: GoogleFonts.montserrat(
                      textStyle: TextStyle(
                          color: Colors.white,
                          fontSize: 24.0,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                ),
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.79,
              child: Container(
                  color: Color(0xFFFAFAFA),
                  height: MediaQuery.of(context).size.height * 0.3,
                  width: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 30, top: 40),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (ctx, index) => (index == 0)
                        ? FlashcardCategoty()
                        : FlashcardBox(
                            flashcard_id: allFlashcard[index - 1].id,
                            index: index - 1),
                    itemCount: 1 + allFlashcard.length,
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
      ),
    );
  }
}
