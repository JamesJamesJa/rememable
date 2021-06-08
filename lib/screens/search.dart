import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:rememable/widgets/bottom-nav-bar.dart';

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
    return Scaffold(
      body: Container(
        width: MediaQuery.of(context).size.width,
        height: MediaQuery.of(context).size.height * 0.9,
        child: Column(
          children: [
            Container(
              height: MediaQuery.of(context).size.height * 0.18,
              color: Color(0xFF749BFF),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Container(
                    padding: EdgeInsets.only(top: 50),
                    height: MediaQuery.of(context).size.height * 0.1,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Image.asset(
                          'images/flashcard-icon.png',
                          height: 30,
                          width: 30,
                        ),
                      ],
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
                              fontSize: 16.0, fontWeight: FontWeight.w400)),
                      unselectedLabelStyle: GoogleFonts.montserrat(
                        textStyle: TextStyle(
                            fontSize: 16.0, fontWeight: FontWeight.w400),
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
              height: MediaQuery.of(context).size.height * 0.4,
              width: MediaQuery.of(context).size.width * 0.9,
              child: TabBarView(
                controller: _tabController,
                children: [
                  Center(child: Text('0')),
                  Center(child: Text('1')),
                  Center(child: Text('2')),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
