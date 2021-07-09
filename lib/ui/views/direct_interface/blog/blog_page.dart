import 'dart:ui';

import 'package:cullen/ui/components/bottom/footer.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

import '../../../components/buttons/blog_page_button.dart';
import '../../window_layer.dart';

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
                child: const Text(
                  "Welcome to Numflurry",
                  style: TextStyle(
                    fontSize: 70,
                  ),
                ),
              ),
              Flexible(
                flex: 2,
                child: const Text(
                  "   Welcome to NumFlurry Nonprofit Organization's website.",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.w400),
                  //maxLines: 2,
                ),
              ),
              Flexible(
                flex: 2,
                child: Container(
                  margin: const EdgeInsets.all(20),
                  height: 40,
                  width: 126,
                  child: OutlineButton(
                    borderSide: const BorderSide(width: 1.0),
                    onPressed: () {
                      // Respond to button press
                    },
                    child: const Text(
                      "Get Started",
                      style: const TextStyle(color: Colors.black),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}

double position = 0;

class BlogPage extends StatefulWidget with DirectInterface {
  final ValueChanged<String>? handler;

  BlogPage({this.handler});

  @override
  _BlogPageState createState() => _BlogPageState();

  @override
  bool isScrollable() => true;
}

class _BlogPageState extends State<BlogPage> with TickerProviderStateMixin {
  @override
  void initState() {
    super.initState();
  }

  late double top;

  //double position = 0;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [BlogHeader(), BlogTopicChips(), Footer()],
    );
  }
}
