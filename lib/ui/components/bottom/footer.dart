import 'package:flutter/material.dart';
import 'package:flutter_linkify/flutter_linkify.dart';
import 'package:localization/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:router/path_handler.dart';
import 'package:url_launcher/url_launcher.dart';

class Footer extends StatelessWidget {
  final titleFont = const TextStyle(fontWeight: FontWeight.w800, fontSize: 15);
  final buttonStyle = const ButtonStyle(enableFeedback: false);
  final textAlign = TextAlign.center;

  @override
  Widget build(BuildContext context) {
    final _text = (str) => Text(str, textAlign: this.textAlign);
    final _title =
        (str) => Text(str, textAlign: this.textAlign, style: titleFont);

    return Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(color: Colors.amberAccent),
        child: Column(
          children: [
            Divider(),
            Table(
              // border: TableBorder.all(),
              defaultVerticalAlignment: TableCellVerticalAlignment.middle,
              children: [
                TableRow(children: [
                  _title(S.of(context).about),
                  _title(S.of(context).status),
                  _title(S.of(context).legal),
                ]),
                TableRow(children: [Divider(), Divider(), Divider()]),
                TableRow(
                  children: [
                    TextButton(
                      onPressed: () =>
                          Provider.of<PathHandler>(context, listen: false)
                              .changePath("about-me"),
                      style: buttonStyle,
                      child: _text(S.of(context).about_me),
                    ),
                    TextButton(
                        onPressed: () =>
                            Provider.of<PathHandler>(context, listen: false)
                                .changePath("services"),
                        style: buttonStyle,
                        child: _text(S.of(context).services)),
                    TextButton(
                        onPressed: () =>
                            Provider.of<PathHandler>(context, listen: false)
                                .changePath("cookie-policy"),
                        style: buttonStyle,
                        child: _text(S.of(context).cookie_policy)),
                  ],
                ),
                TableRow(
                  children: [
                    TextButton(
                        onPressed: () =>
                            Provider.of<PathHandler>(context, listen: false)
                                .changePath("about-the-webpages"),
                        style: buttonStyle,
                        child: _text(S.of(context).about_the_webpages)),
                    TextButton(
                        onPressed: () => launch(
                            "https://stats.uptimerobot.com/vDYQ8hWXoM/788299671"),
                        style: buttonStyle,
                        child: _text(S.of(context).website_status)),
                    TextButton(
                        onPressed: () =>
                            Provider.of<PathHandler>(context, listen: false)
                                .changePath("disclaimer"),
                        style: buttonStyle,
                        child: _text(S.of(context).disclaimer)),
                  ],
                ),
                TableRow(
                  children: [
                    TextButton(
                        onPressed: () => launch("https://github.com/keyskull"),
                        style: buttonStyle,
                        child: _text(S.of(context).my_github)),
                    TextButton(
                        onPressed: () =>
                            Provider.of<PathHandler>(context, listen: false)
                                .changePath("web_browser"),
                        style: buttonStyle,
                        child: _text("Web Browser")),
                    Container()
                  ],
                ),
                TableRow(
                  children: [
                    TextButton(
                        onPressed: () =>
                            launch("https://www.linkedin.com/in/cullenlee/"),
                        style: buttonStyle,
                        child: _text(S.of(context).my_linkedin_profile)),
                    Container(),
                    Container()
                  ],
                ),
              ],
            ),
            Divider(
              thickness: 3,
            ),
            Padding(
                padding: EdgeInsets.all(10),
                child: Linkify(
                  onOpen: (link) async {
                    if (await canLaunch(link.url)) {
                      await launch(link.url);
                    } else {
                      throw 'Could not launch $link';
                    }
                  },
                  text: S.of(context).license_announcement,
                  textAlign: TextAlign.center,
                )),
            TextButton(
                onPressed: () =>
                    Provider.of<PathHandler>(context, listen: false)
                        .changePath("contact"),
                style: buttonStyle,
                child: _text(S.of(context).contact_me)),
          ],
        ));
  }
}
