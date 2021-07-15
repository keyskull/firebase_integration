import 'package:cullen/properties/common.dart';
import 'package:flutter/material.dart';
import 'package:localization/generated/l10n.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'package:router/path_handler.dart';
import 'package:router/route.dart';
import 'package:router/route_data.dart';
import 'package:utilities/screen_size.dart';

import '../../../properties/navigation_content.dart';
import '../../../properties/navigation_rail_buttons.dart';

/// This is the stateful widget that the main application instantiates.
class CustomNavigationRail extends StatefulWidget {
  final Widget child;

  CustomNavigationRail({
    required Key key,
    required this.child,
  }) : super(key: key);

  @override
  CustomNavigationRailState createState() => CustomNavigationRailState(
        child: child,
      );
}

/// This is the private State class that goes with MyStatefulWidget.
class CustomNavigationRailState extends State<CustomNavigationRail>
    with SingleTickerProviderStateMixin {
  final Widget child;

  CustomNavigationRailState({
    required this.child,
  });

  late AnimationController _controller;

  int _selectedIndex = 0;
  bool _extend = false;
  bool _hidden = false;
  double _width = 83;
  String path = "";

  // var _appBarHeight = AppBarHeight;
  // late bool Function(Notification) function;

  _updateState() {
    setState(() {
      _extend = !_extend;
    });
  }

  closeRail() {
    setState(() {
      _extend = false;
    });
  }

  bool extendNavigationRail() {
    setState(() {
      _hidden = !_hidden;
    });
    _hidden ? _controller.forward() : _controller.reverse();
    return _hidden;
  }

  @override
  void initState() {
    _controller = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );
    // _selectedIndex = 0;
    // controller.forward();

    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    // globalNotificationListeners.remove(this.hashCode.toString());
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    ScreenSize.initScreenSize(context);
    final navigationRailSize = Size(_width, ScreenSize.getScreenSize.height);
    final _curveAnimation = CurvedAnimation(
      parent: _controller,
      curve: Curves.decelerate,
    );

    final __contentRelativeRectFromSize_1 = RelativeRect.fromSize(
        Rect.fromLTWH(_width, 0, ScreenSize.getScreenSize.width - _width,
            ScreenSize.getScreenSize.height),
        ScreenSize.getScreenSize);

    final __contentRelativeRectFromSize_2 = RelativeRect.fromSize(
        Rect.fromLTWH(0, 0, ScreenSize.getScreenSize.width,
            ScreenSize.getScreenSize.height),
        ScreenSize.getScreenSize);

    final __navigationRailRelativeRectFromSize_1 = RelativeRect.fromSize(
        Rect.fromLTWH(0, 0, _width, ScreenSize.getScreenSize.height),
        navigationRailSize);

    final __navigationRailRelativeRectFromSize_2 = RelativeRect.fromSize(
        Rect.fromLTWH(-_width, 0, _width, ScreenSize.getScreenSize.height),
        navigationRailSize);

    final _animationContent = ScreenSize.isDesktop(context)
        ? RelativeRectTween(
                begin: __contentRelativeRectFromSize_1,
                end: __contentRelativeRectFromSize_2)
            .animate(_curveAnimation)
        : RelativeRectTween(
            begin: __contentRelativeRectFromSize_2,
            end: __contentRelativeRectFromSize_1,
          ).animate(_curveAnimation);

    final _animationNavigationRail = ScreenSize.isDesktop(context)
        ? RelativeRectTween(
            begin: __navigationRailRelativeRectFromSize_1,
            end: __navigationRailRelativeRectFromSize_2,
          ).animate(_curveAnimation)
        : RelativeRectTween(
                begin: __navigationRailRelativeRectFromSize_2,
                end: __navigationRailRelativeRectFromSize_1)
            .animate(_curveAnimation);

    return AnimatedContainer(
        duration: Duration(seconds: 1),
        color: Colors.white,
        child: Stack(
          children: <Widget>[
            PositionedTransition(
              rect: _animationContent,
              child: NotificationListener<Notification>(
                  onNotification: (notification) {
                    return !globalNotificationListeners.values
                        .map((e) => e(notification))
                        .contains(false);
                  },
                  child: child),
            ),
            PositionedTransition(
                rect: _animationNavigationRail,
                child: Row(
                  children: [
                    Container(
                        color: mainThemeColor,
                        child: PointerInterceptor(
                          child: NavigationRailTheme(
                            data: NavigationRailThemeData(
                                unselectedLabelTextStyle:
                                    TextStyle(color: Colors.white)),
                            child: NavigationRail(
                                unselectedIconTheme:
                                    IconThemeData(color: Colors.white),
                                selectedIconTheme:
                                    IconThemeData(color: Colors.white),
                                backgroundColor: Colors.black54,
                                extended: _extend,
                                selectedIndex: _selectedIndex,
                                onDestinationSelected: (int index) {
                                  if (_selectedIndex != index) {
                                    setState(() {
                                      _selectedIndex = index;
                                    });

                                    Provider.of<PathHandler>(context,
                                            listen: false)
                                        .changePath(buttonPaths[index]);
                                  } else if ((((globalNavigatorKey
                                                  .currentState!
                                                  .widget
                                                  .pages
                                                  .first
                                                  .key as ValueKey)
                                              .value) as RouteData)
                                          .path
                                          .substring(1) !=
                                      buttonPaths[index]) {
                                    Provider.of<PathHandler>(context,
                                            listen: false)
                                        .changePath(buttonPaths[index]);
                                  }
                                },
                                labelType: NavigationRailLabelType.none,
                                leading: Stack(
                                  children: [
                                    Container(
                                        width: _width,
                                        height: 30,
                                        alignment: Alignment(0, 0.2),
                                        child: SizedBox.expand(
                                            child: Semantics(
                                                button: true,
                                                label: S
                                                    .of(context)
                                                    .home_page_name,
                                                child: IconButton(
                                                  iconSize: 25,
                                                  icon: Icon(
                                                    Icons.dehaze,
                                                    color: Colors.white,
                                                  ),
                                                  onPressed: _updateState,
                                                )))),
                                  ],
                                ),
                                destinations: new List.generate(
                                    buttonNames.length,
                                    (index) => NavigationRailDestination(
                                          icon: buttonIcons[index],
                                          selectedIcon:
                                              buttonSelectedIcons[index],
                                          label: buttonNames[index],
                                        ))),
                          ),
                        )),
                    VerticalDivider(thickness: 1, width: 1),
                    // This is the main content.
                  ],
                ))
          ],
        ));
  }

// @override
// void afterFirstLayout(BuildContext context) {
//   globalNotificationListeners[this.hashCode.toString()] =
//       (scrollNotification) {
//     if (scrollNotification is ScrollUpdateNotification) {
//       final distance = (scrollNotification.scrollDelta ?? 0);
//       log('ScrollUpdateNotification: ' + distance.toString(),
//           name: 'ml.numflurry.custom_navigation_rail');
//       if (distance > 0)
//         this.setState(() {
//           final counted = _appBarHeight - distance;
//           _appBarHeight = counted >= 0 ? counted : 0;
//         });
//       else
//         this.setState(() {
//           _appBarHeight = AppBarHeight;
//         });
//     }
//     return true;
//   };
// }
}
