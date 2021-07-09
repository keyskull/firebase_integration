import 'package:cullen/ui/components/bottom/footer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:localization/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:utilities/screen_size.dart';
import 'package:utilities/widgets/scroll_view/universal_single_child_scroll_view.dart';

class Contact extends StatelessWidget {
  @override
  Widget build(BuildContext context) => UniversalSingleChildScrollView(
        child: Padding(
            padding:
                const EdgeInsets.only(top: 80, bottom: 30, left: 10, right: 10),
            child: Column(
              children: [
                Text(
                  S.of(context).contact_me,
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.w900),
                ),
                Divider(
                  thickness: 5,
                ),
                Linkify(
                  onOpen: (link) async {
                    if (await canLaunch(link.url)) {
                      await launch(link.url);
                    } else {
                      throw 'Could not launch $link';
                    }
                  },
                  text: "Email: admin@cullen.ml\nWeChat ID: cullen_insights",
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
                ),
                Container(
                  width: ScreenSize.getScreenSize.height * 0.6,
                  height: ScreenSize.getScreenSize.height * 0.6,
                  decoration: BoxDecoration(
                      image: DecorationImage(
                          fit: BoxFit.cover,
                          image: AssetImage(
                              "images/4ddce98e9381ffa68cf9967919669e4.png"))),
                ),
                Footer()
              ],
            )),
      );
}
