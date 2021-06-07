import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.selectedTabIndex.toString())),
    );
  }
}
