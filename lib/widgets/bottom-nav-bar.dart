import 'package:flutter/material.dart';

class BottomNavBar extends StatelessWidget {
  final int selectedTabIndex;
  final Function changeIndex;
  final bool isPop;
  const BottomNavBar(
      {this.selectedTabIndex, this.changeIndex, this.isPop = false});
  Widget build(BuildContext context) {
    return new Theme(
      data: Theme.of(context).copyWith(canvasColor: Colors.white),
      child: SizedBox(
        height: 54,
        child: new BottomNavigationBar(
          currentIndex: selectedTabIndex,
          type: BottomNavigationBarType.fixed,
          onTap: (_) {
            changeIndex(_);
            if (isPop) {
              Navigator.pop(context);
            }
          },
          items: [
            BottomNavigationBarItem(
              icon: selectedTabIndex == 0
                  ? Icon(
                      Icons.home_rounded,
                      size: 25,
                      color: Color(0xFFDAC5F8),
                    )
                  : Icon(
                      Icons.home_outlined,
                      size: 25,
                      color: Color(0xFFBFBFBF),
                    ),
              label: "",
              // title: Text("Instructors",
              //     style: TextStyle(fontSize: 11, color: Color(0xFFDAC5F8)))
            ),
            BottomNavigationBarItem(
              icon: selectedTabIndex == 1
                  ? Icon(
                      Icons.search_rounded,
                      size: 25,
                      color: Color(0xFFDAC5F8),
                    )
                  : Icon(
                      Icons.search_outlined,
                      size: 25,
                      color: Color(0xFFBFBFBF),
                    ),
              label: "",
              // title: Text("Favorite",
              //     style: TextStyle(fontSize: 11, color: Color(0xFFDAC5F8)))
            ),
            BottomNavigationBarItem(
              icon: selectedTabIndex == 2
                  ? Icon(
                      Icons.add_circle_rounded,
                      size: 25,
                      color: Color(0xFFDAC5F8),
                    )
                  : Icon(
                      Icons.add_circle_outline_rounded,
                      size: 25,
                      color: Color(0xFFBFBFBF),
                    ),
              label: "",
              // title: Text("Calendar",
              //     style: TextStyle(fontSize: 11, color: Color(0xFFDAC5F8)))
            ),
            BottomNavigationBarItem(
              icon: selectedTabIndex == 3
                  ? Icon(
                      Icons.person,
                      size: 25,
                      color: Color(0xFFDAC5F8),
                    )
                  : Icon(
                      Icons.person_outline_rounded,
                      size: 25,
                      color: Color(0xFFBFBFBF),
                    ),
              label: "",
              // title: Text("Instructors",
              //     style: TextStyle(fontSize: 11, color: Color(0xFF8675A9)))
            ),
          ],
        ),
      ),
    );
  }
}
