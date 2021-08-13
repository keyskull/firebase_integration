import 'package:flutter/material.dart';
import 'package:localization/generated/l10n.dart';

import 'buttons.dart';

class LoginDialog extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SimpleDialog(
        contentPadding: const EdgeInsets.fromLTRB(10, 20, 10, 20),
        elevation: 2,
        title: Center(
            child: Text(
          S.of(context).login,
        )),
        children: [signInButton(), googleSignInButton()]);
  }
}
