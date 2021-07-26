import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rememable/providers/allFlashcard.dart';
import 'package:rememable/providers/authen.dart';
import 'package:rememable/widgets/flashcard-box.dart';

class StudySet extends StatefulWidget {
  final int selectedTabIndex;
  final Function changeIndex;
  const StudySet({
    Key key,
    this.selectedTabIndex,
    this.changeIndex,
  }) : super(key: key);
  @override
  _StudySetState createState() => _StudySetState();
}

class _StudySetState extends State<StudySet>
    with SingleTickerProviderStateMixin {
  @override
  TabController _tabController;
  final List<Widget> myTabs = [
    Tab(text: "Favorite"),
    Tab(text: "Created"),
    Tab(text: "Studied"),
  ];
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  Widget build(BuildContext context) {
    return Scaffold(body: Consumer2<AllFlashcard, Authen>(
        builder: (context, allFlashcard, user, child) {
      return Container(
        height: MediaQuery.of(context).size.height,
        child: Column(
          children: [
            Container(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height * 0.17,
              color: Color(0xFF749BFF),
              child: Column(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height * 0.12,
                    child: Row(
                      children: [
                        Container(
                          width: MediaQuery.of(context).size.width * 0.15,
                          padding: EdgeInsets.only(top: 30.0),
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
                              'My Study Sets',
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
                          width: MediaQuery.of(context).size.width * 0.15,
                          padding: EdgeInsets.only(top: 30.0),
                          child: IconButton(
                              icon: Icon(
                                Icons.add,
                                size: 26,
                                color: Color(0xFF749BFF),
                              ),
                              onPressed: () {
                                Navigator.pop(context);
                              }),
                        )
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    child: TabBar(
                      indicatorPadding: EdgeInsets.all(3),
                      labelPadding: EdgeInsets.all(0),
                      controller: _tabController,
                      labelColor: Colors.white,
                      unselectedLabelColor: Colors.white,
                      labelStyle: GoogleFonts.montserrat(
                          textStyle: TextStyle(
                              fontSize: 18.0, fontWeight: FontWeight.w400)),
                      unselectedLabelStyle: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontSize: 18.0, fontWeight: FontWeight.w400),
                      ),
                      indicatorColor: Color(0xFFFFD874),
                      indicatorSize: TabBarIndicatorSize.label,
                      tabs: myTabs,
                    ),
                  ),
                ],
              ),
            ),
            Container(
              height: MediaQuery.of(context).size.height * 0.74,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Container(
                      child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 30, top: 10),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (ctx, index) =>
                        allFlashcard.inSearch(user.getFavIdByIndex(index), "")
                            ? FlashcardBox(
                                flashcard_id: user.getFavIdByIndex(index),
                                index: index,
                              )
                            : Container(),
                    itemCount: user.favLength(),
                  )),
                  Container(
                      child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 30, top: 10),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (ctx, index) =>
                        allFlashcard.inSearch(user.getOwnIdByIndex(index), "")
                            ? FlashcardBox(
                                flashcard_id: user.getOwnIdByIndex(index),
                                index: index)
                            : Container(),
                    itemCount: user.getOwnLength(),
                  )),
                  Container(
                      child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 30, top: 10),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (ctx, index) => allFlashcard.inSearch(
                            user.getStudiedIdByIndex(index), "")
                        ? FlashcardBox(
                            flashcard_id: user.getStudiedIdByIndex(index),
                            index: index)
                        : Container(),
                    itemCount: user.getStudiedLength(),
                  )),
                ],
              ),
            ),
          ],
        ),
      );
    }));
  }
}
