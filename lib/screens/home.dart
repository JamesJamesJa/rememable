import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rememable/widgets/bottom-nav-bar.dart';

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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.selectedTabIndex.toString())),
    );
  }
}
