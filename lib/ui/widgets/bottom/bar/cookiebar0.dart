import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_universal_router/route.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';

bool _cookieAccepted = true;

cookieCheck() => SharedPreferences.getInstance().then(
    (prefs) => _cookieAccepted = prefs.getBool('cookie_accepted') ?? false);

class CookieBar0 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    return CookieBar0State();
  }
}

class CookieBar0State extends State<CookieBar0> {
  @override
  void initState() {
    cookieCheck();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const fontSize = const TextStyle(color: Colors.black, fontSize: 15);
    Widget bar = Align(
        alignment: Alignment.bottomLeft,
        child: Container(
          alignment: Alignment.bottomLeft,
          constraints: BoxConstraints(maxHeight: 70),
          decoration: new BoxDecoration(
            border: Border.all(color: Colors.black12),
            color: Colors.white,
          ),
          padding: EdgeInsets.all(10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.max,
            children: [
              Flexible(
                  flex: 5,
                  fit: FlexFit.loose,
                  child: const Text(
                    'This site uses cookies. To see how cookies are used, please review our cookie notice. If you agree to our use of cookies, please continue to use our site.',
                    style: fontSize,
                  )),
              Flexible(
                  flex: 2,
                  fit: FlexFit.tight,
                  child: InkWell(
                    child: const Text(
                      'cookie notice',
                      style: fontSize,
                    ),
                    onTap: () =>
                        Provider.of<PathHandler>(context, listen: false)
                            .changePath('cookie-policy'),
                  )),
              Flexible(
                  flex: 1,
                  fit: FlexFit.tight,
                  child: MaterialButton(
                      color: Theme.of(context).colorScheme.secondary,
                      child: Text("Accept", style: fontSize),
                      mouseCursor: SystemMouseCursors.click,
                      onPressed: () {
                        setState(() {
                          SharedPreferences.getInstance().then((value) =>
                              value.setBool('cookie_accepted', true));
                          _cookieAccepted = true;
                        });
                      })),
            ],
          ),
        ));
    return _cookieAccepted ? Container() : bar;
  }
}
