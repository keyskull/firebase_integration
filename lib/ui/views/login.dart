import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:localization/generated/l10n.dart';
import 'package:universal_router/route.dart';

import '../components/buttons.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        signInButton(),
        googleSignInButton(),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () => UniversalRouter.changePath('privacy-policy'),
                child: Text(S.of(context).privacy_policy)),
            TextButton(
                onPressed: () => UniversalRouter.changePath('terms-of-service'),
                child: Text(S.of(context).terms_of_service))
          ],
        )
      ],
    );
  }
}
