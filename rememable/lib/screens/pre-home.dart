import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:loading_animations/loading_animations.dart';
import 'package:provider/provider.dart';
import 'package:rememable/models/flashcard.dart';
import 'package:rememable/providers/allFlashcard.dart';
import 'package:rememable/providers/authen.dart';
import 'package:rememable/screens/create-flashcard.dart';
import 'package:rememable/screens/home.dart';
import 'package:rememable/screens/profile.dart';
import 'package:rememable/screens/search.dart';
import 'package:rememable/widgets/bottom-nav-bar.dart';

class PreHome extends StatefulWidget {
  @override
  _PreHomeState createState() => _PreHomeState();
}

class _PreHomeState extends State<PreHome> with SingleTickerProviderStateMixin {
  int _selectedTabIndex = 0;
  // int delayTime = 0;

  @override
  _changeIndex(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  void initState() {
    Provider.of<Authen>(context, listen: false).getUserProfile().then((_) {
      Provider.of<AllFlashcard>(context, listen: false)
          .flashcardDetails()
          .then((_) {});
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    List<Flashcard> allFlashcard = Provider.of<AllFlashcard>(context).flashcard;

    return allFlashcard.isEmpty
        ? Scaffold(
            body: Center(
            child: LoadingBouncingGrid.square(
              borderColor: Color(0xff749BFF),
              borderSize: 3.0,
              size: 100.0,
              backgroundColor: Color(0xff749BFF),
              duration: Duration(milliseconds: 1200),
            ),
          ))
        : Scaffold(
            body: Container(
              height: MediaQuery.of(context).size.height,
              child: (_selectedTabIndex == 0)
                  ? Home(
                      selectedTabIndex: _selectedTabIndex,
                      changeIndex: _changeIndex,
                    )
                  : (_selectedTabIndex == 1)
                      ? Search(
                          selectedTabIndex: _selectedTabIndex,
                          changeIndex: _changeIndex,
                        )
                      : (_selectedTabIndex == 2)
                          ? CreateFlashcard(
                              selectedTabIndex: _selectedTabIndex,
                              changeIndex: _changeIndex,
                            )
                          : Profile(
                              selectedTabIndex: _selectedTabIndex,
                              changeIndex: _changeIndex,
                            ),
            ),
            bottomNavigationBar: new Theme(
              data: Theme.of(context).copyWith(canvasColor: Colors.white),
              child: Container(
                decoration: BoxDecoration(
                  boxShadow: [
                    BoxShadow(
                      color: Colors.grey,
                    ),
                  ],
                ),
                height: MediaQuery.of(context).size.height * 0.09,
                child: BottomNavBar(
                    selectedTabIndex: _selectedTabIndex,
                    changeIndex: _changeIndex),
              ),
            ),
          );
  }
}
