import 'dart:ui';

import 'package:cullen/ui/components/bottom/footer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_display_layer_framework/windows/window_layer.dart';
import 'package:localization/generated/l10n.dart';

import '../../../components/buttons/blog_page_button.dart';

void main() {
  runApp(Blog());
}

class Blog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlogPage();
  }
}

class BlogHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        height: 400,
        alignment: Alignment.bottomLeft,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/flutter.jpg"),
              fit: BoxFit.cover,
            ),
            border: const Border(bottom: BorderSide(width: 1))),
        child: Padding(
          padding: EdgeInsets.only(left: 50, top: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Flexible(
                flex: 3,
                child: Text(
                  S.of(context).blog,
                  style: TextStyle(
                    fontSize: 70,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: Text(
                  S.of(context).blog_description,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  //maxLines: 2,
                ),
              ),
            ],
          ),
        ));
  }
}

double position = 0;

class BlogPage extends StatefulWidget with SingleWindowInterfaceMixin {
  final ValueChanged<String>? handler;

  BlogPage({this.handler});

  @override
  _BlogPageState createState() => _BlogPageState();

  @override
  bool scrollable() => true;
}

class _BlogPageState extends State<BlogPage> with TickerProviderStateMixin {
  late double top;

  //double position = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [BlogHeader(), BlogTopicChips(), Footer()],
    );
  }
}
