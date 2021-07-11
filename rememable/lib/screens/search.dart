import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:rememable/providers/allFlashcard.dart';
import 'package:rememable/providers/authen.dart';
import 'package:rememable/widgets/bottom-nav-bar.dart';
import 'package:rememable/widgets/flashcard-box.dart';

class Search extends StatefulWidget {
  final int selectedTabIndex;
  final Function changeIndex;
  const Search({
    Key key,
    this.selectedTabIndex,
    this.changeIndex,
  }) : super(key: key);
  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> with SingleTickerProviderStateMixin {
  TabController _tabController;
  TextEditingController searchTextTemp = TextEditingController(text: "");
  TextEditingController searchText = TextEditingController(text: "");
  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 3);
    super.initState();
  }

  Widget build(BuildContext context) {
    final List<Widget> myTabs = [
      Tab(text: "Popular"),
      Tab(text: "Favorite"),
      Tab(text: "New"),
    ];
    return Scaffold(body: Consumer2<AllFlashcard, Authen>(
        builder: (context, allFlashcard, user, child) {
      return Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.91,
        color: Color(0xFFFAFAFA),
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.17,
              color: Color(0xFF749BFF),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 30),
                    height: MediaQuery.of(context).size.height * 0.11,
                    child: Center(
                      child: Container(
                        alignment: Alignment.center,
                        width: MediaQuery.of(context).size.width * 0.8,
                        height: 40,
                        margin: EdgeInsets.only(top: 30.0),
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
                            padding: EdgeInsets.fromLTRB(10, 5, 20, 10),
                            child: TextField(
                              controller: searchTextTemp,
                              decoration: InputDecoration(
                                  icon: Container(
                                    padding: EdgeInsets.only(left: 8.0, top: 6),
                                    child: Icon(
                                      Icons.search_rounded,
                                      size: 20,
                                      color: Color(0xFF8D8D8D),
                                    ),
                                  ),
                                  border: InputBorder.none,
                                  hintText: 'Search',
                                  hintStyle: TextStyle(
                                    color: Color(0xFFC7C7CC),
                                    fontSize: 14.0,
                                    fontWeight: FontWeight.w300,
                                    fontFamily: 'Montserrat',
                                  ),
                                  contentPadding:
                                      EdgeInsets.only(bottom: 11.0)),
                              onChanged: (value) {
                                setState(() {
                                  searchText.text = value;
                                });
                              },
                            )),
                      ),
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.05,
                    // padding: EdgeInsets.only(
                    //   top: 10.0,
                    //   bottom: 20,
                    // ),
                    // color: Colors.white,
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
                      // width: MediaQuery.of(context).size.width * 0.8,
                      // height: MediaQuery.of(context).size.height * 0.63,
                      child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 30, top: 10),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (ctx, index) => allFlashcard.inSearch(
                            allFlashcard
                                .getId(allFlashcard.getIndexByRating(index)),
                            searchText.text)
                        ? FlashcardBox(
                            flashcard_id: allFlashcard
                                .getId(allFlashcard.getIndexByRating(index)),
                            index: allFlashcard.getIndexByRating(index))
                        : Container(),
                    // InstructorBox(
                    //   id: teachersTest[index].id,
                    //   name: teachersTest[index].name,
                    //   fav: Provider.of<Student>(context)
                    //       .checkFav(teachersTest[index].id),
                    //   index: index,
                    //   selectedTabIndex: widget.selectedTabIndex,
                    //   changeIndex: widget.changeIndex,
                    // ),
                    itemCount: allFlashcard.getLength(),
                    // student != null ? teachersTest.length : 0,
                  )),
                  Container(
                      child: ListView.builder(
                    padding: EdgeInsets.only(bottom: 30, top: 10),
                    scrollDirection: Axis.vertical,
                    itemBuilder: (ctx, index) => allFlashcard.inSearch(
                            user.getFavIdByIndex(index), searchText.text)
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
                    itemBuilder: (ctx, index) => allFlashcard.inSearch(
                            allFlashcard
                                .getId(allFlashcard.getLength() - index - 1),
                            searchText.text)
                        ? FlashcardBox(
                            flashcard_id: allFlashcard
                                .getId(allFlashcard.getLength() - index - 1),
                            index: allFlashcard.getLength() - index - 1)
                        : Container(),
                    itemCount: allFlashcard.getLength(),
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
