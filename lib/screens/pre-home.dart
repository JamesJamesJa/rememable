import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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

  @override
  _changeIndex(int index) {
    setState(() {
      _selectedTabIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
              selectedTabIndex: _selectedTabIndex, changeIndex: _changeIndex),
        ),
      ),
    );
  }
}
