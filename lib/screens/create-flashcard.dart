import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:rememable/widgets/bottom-nav-bar.dart';

class CreateFlashcard extends StatefulWidget {
  final int selectedTabIndex;
  final Function changeIndex;
  const CreateFlashcard({
    Key key,
    this.selectedTabIndex,
    this.changeIndex,
  }) : super(key: key);
  @override
  _CreateFlashcardState createState() => _CreateFlashcardState();
}

class _CreateFlashcardState extends State<CreateFlashcard>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(child: Text(widget.selectedTabIndex.toString())),
    );
  }
}
