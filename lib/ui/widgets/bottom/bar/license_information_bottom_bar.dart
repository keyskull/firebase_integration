import 'package:flutter/material.dart';
import 'package:localization/generated/l10n.dart';

class LicenseInformationBottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) => SafeArea(
          child: Align(
        alignment: Alignment.bottomLeft,
        child: Container(
            constraints: BoxConstraints(maxHeight: 20),
            padding: EdgeInsets.only(left: 10, right: 10),
            decoration: BoxDecoration(
                color: Colors.white70,
                border: const Border(top: BorderSide(width: 1))),
            child: Text(S.of(context).license_announcement)),
      ));
}
