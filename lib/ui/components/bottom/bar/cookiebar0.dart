import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:router/path_handler.dart';
import 'package:shared_preferences/shared_preferences.dart';

class CookieBar0 extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => CookieBar0State();
}

class CookieBar0State extends State<CookieBar0> {
  Future<bool> _checkAcceptance() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool('cookie_accepted') ?? false;
  }

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    const fontSize = const TextStyle(fontSize: 15);
    final bar =
        // Opacity(
        //     opacity: 0.6,
        //     child: ColoredBox(
        //       color: Colors.black,
        //     )),
        Align(
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
                mainAxisSize: MainAxisSize.min,
                children: [
                  Expanded(
                      flex: 5,
                      child: const Text(
                        'This site uses cookies. To see how cookies are used, please review our cookie notice. If you agree to our use of cookies, please continue to use our site.',
                        style: fontSize,
                      )),
                  Expanded(
                      flex: 1,
                      child: InkWell(
                        child: const Text(
                          'cookie notice',
                          style: fontSize,
                        ),
                        onTap: () =>
                            Provider.of<PathHandler>(context, listen: false)
                                .changePath('cookie-policy'),
                      )),
                  Expanded(
                      flex: 1,
                      child: MaterialButton(
                          child: Text("Accept", style: fontSize),
                          color: Colors.blue,
                          mouseCursor: SystemMouseCursors.click,
                          onPressed: () {
                            setState(() {
                              SharedPreferences.getInstance().then((value) =>
                                  value.setBool('cookie_accepted', true));
                              this.deactivate();
                              this.dispose();
                            });
                          }))
                ],
              ),
            ));
    return FutureBuilder(
        future: _checkAcceptance(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            if (snapshot.hasError)
              return Container();
            else if (!(snapshot.requireData as bool))
              return SafeArea(child: bar);
            else
              return Container();
          } else
            return Container();
        });
  }
}
