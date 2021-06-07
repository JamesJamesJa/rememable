import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rememable/widgets/bottom-nav-bar.dart';

class Profile extends StatefulWidget {
  final int selectedTabIndex;
  final Function changeIndex;
  const Profile({
    Key key,
    this.selectedTabIndex,
    this.changeIndex,
  }) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.selectedTabIndex.toString())),
    );
  }
}
