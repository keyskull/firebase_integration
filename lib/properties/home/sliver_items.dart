library sliver_items;

import 'package:cullen/ui/widgets/buttons/quick_access_button.dart';
import 'package:cullen/ui/widgets/sliver/transition_sliver_appbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:utilities/screen_size.dart';

class SliverItems {
  static quickAccessSliver(
          BuildContext context, ScrollController scrollController) =>
      <Widget>[
        TransitionSliverAppBar(
            title: Text(
              "Quick Access",
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.w600,
              ),
            ),
            avatar: ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: Image.network(
                  "https://avatars1.githubusercontent.com/u/3397225",
                  loadingBuilder: (context, child, progress) {
                    return progress == null
                        ? child
                        : CircularProgressIndicator();
                  },
                  width: 150,
                  height: 150,
                )),
            backgroundColor: Colors.black38,
            pinned: true,
            maxHeight: 200,
            minHeight: 30,
            onPressed: () => scrollController.animateTo(
                ScreenSize.getScreenSize.height,
                duration: Duration(milliseconds: 1500),
                curve: Curves.decelerate),
            key: null,
            child: QuickAccessButton())
      ];

  static List blog = [SliverAppBar()];
}

// final List _timelineData = HistoryTimeline(
//   steps: LifeHistory.lifeHistory(),
// ).buildList();
