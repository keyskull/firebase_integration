import 'package:flutter/material.dart';
import 'package:framework/windows/window_layer.dart';
import 'package:localization/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:router/path_handler.dart';

class AboutMe extends StatelessWidget with SingleWindowInterfaceMixin {
  final textButtonStyle = TextButton.styleFrom(
      padding: const EdgeInsets.all(10), enableFeedback: false);

  @override
  Widget build(BuildContext context) => Padding(
      padding: const EdgeInsets.only(top: 30, bottom: 30, left: 10, right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            S.of(context).about,
            style: TextStyle(fontSize: 30, fontWeight: FontWeight.w900),
          ),
          Divider(
            thickness: 5,
          ),
          Text(
            S.of(context).header_description,
            style: TextStyle(fontSize: 20),
          ),
          Row(
            children: [
              TextButton(
                  onPressed: () =>
                      Provider.of<PathHandler>(context, listen: false)
                          .changePath("contact"),
                  style: textButtonStyle,
                  child: Text(
                    S.of(context).contact_me,
                    textAlign: TextAlign.center,
                  )),
              TextButton(
                  onPressed: () {
                    Provider.of<PathHandler>(context, listen: false)
                        .changePath('disclaimer');
                  },
                  style: textButtonStyle,
                  child: Text('Disclaimer')),
              TextButton(
                  onPressed: () {
                    Provider.of<PathHandler>(context, listen: false)
                        .changePath('cookie-policy');
                  },
                  style: textButtonStyle,
                  child: Text('Cookie Policy'))
            ],
          ),
        ],
      ));

  @override
  bool scrollable() => true;
}
