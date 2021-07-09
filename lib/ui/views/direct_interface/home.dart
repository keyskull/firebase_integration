import 'package:cullen/ui/components/bottom/footer.dart';
import 'package:cullen/ui/components/cover/home_page_cover.dart';
import 'package:cullen/ui/components/sliver_list/sliver_appbar_delegate.dart';
import 'package:flutter/material.dart' hide Step;
import 'package:flutter/rendering.dart';
import 'package:localization/generated/l10n.dart';

class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late ScrollController scrollController;

  _HomeState();

  @override
  void initState() {
    scrollController = ScrollController();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final recentProject = [
      SliverAppBarDelegate(
        pinned: true,
        maxHeight: 200,
        minHeight: 75,
        child: Container(
            decoration: BoxDecoration(
                color: Colors.black87,
                image: DecorationImage(
                  colorFilter:
                      ColorFilter.mode(Colors.black54, BlendMode.darken),
                  image: AssetImage('images/bird.gif'),
                  fit: BoxFit.cover,
                )),
            child: MaterialButton(
                mouseCursor: SystemMouseCursors.click,
                onPressed: () {},
                child: Center(
                  child: Text(
                    S.of(context).recent_projects,
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ))),
      ),
      SliverAppBarDelegate(
        pinned: false,
        minHeight: 1500,
        child: Opacity(
          opacity: 0.8,
          child: Container(
            color: Colors.white,
          ),
        ),
      )
    ];

    final newestArticles = [
      SliverAppBarDelegate(
        pinned: true,
        maxHeight: 200,
        minHeight: 75,
        child: Container(
            decoration: BoxDecoration(
                color: Colors.black87,
                image: DecorationImage(
                  colorFilter:
                      ColorFilter.mode(Colors.black54, BlendMode.darken),
                  image: AssetImage('images/bird2.jpg'),
                  fit: BoxFit.cover,
                )),
            child: MaterialButton(
                mouseCursor: SystemMouseCursors.click,
                onPressed: () {},
                child: Center(
                  child: Text(
                    S.of(context).newest_articles,
                    style: TextStyle(
                        fontSize: 40,
                        fontWeight: FontWeight.w600,
                        color: Colors.white),
                  ),
                ))),
      ),
      SliverAppBarDelegate(
        pinned: false,
        minHeight: 1500,
        child: Opacity(
          opacity: 0.8,
          child: Container(
            color: Colors.white,
          ),
        ),
      )
    ];
    final List<Widget> content = [...recentProject, ...newestArticles];

    return Container(
        decoration: BoxDecoration(
            color: Colors.black87,
            image: DecorationImage(
              colorFilter: ColorFilter.mode(Colors.black54, BlendMode.darken),
              image: AssetImage("images/4703133.jpg"),
              fit: BoxFit.cover,
            )),
        child: NestedScrollView(
          controller: scrollController,
          headerSliverBuilder: (context, innerBoxIsScrolled) {
            return <Widget>[
              homePageCover(
                  context: context, scrollController: scrollController)
            ];
          },
          body: CustomScrollView(
            slivers: [
              ...content,
              SliverList(delegate: SliverChildListDelegate([Footer()]))
            ],
          ),

          // SliverFixedExtentList(
          //   itemExtent: 110000.0,
          //   delegate: SliverChildListDelegate(
          //     [HistoryTimeline(steps: LifeHistory.lifeHistory())],
          //   ),
          // ),
        ));
  }
}
