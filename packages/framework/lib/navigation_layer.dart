import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:localization/generated/l10n.dart';
import 'package:pointer_interceptor/pointer_interceptor.dart';
import 'package:provider/provider.dart';
import 'package:router/path_handler.dart';
import 'package:router/route.dart';
import 'package:router/route_data.dart';
import 'package:utilities/screen_size.dart';

import '/properties/common.dart';
import '../../../properties/navigation_rail_buttons.dart';
import 'widgets/floating_action_button.dart';

part 'widgets/custom_navigation_rail.dart';

class NavigationLayer extends StatefulWidget {
  final Widget child;
  final GlobalKey<CustomNavigationRailState> navigationRailKey = GlobalKey();

  NavigationLayer({required this.child});

  @override
  NavigationLayerState createState() =>
      NavigationLayerState(child: child, navigationRailKey: navigationRailKey);
}

class NavigationLayerState extends State<NavigationLayer>
    with TickerProviderStateMixin {
  final Widget child;
  final GlobalKey<CustomNavigationRailState> navigationRailKey;

  NavigationLayerState({required this.child, required this.navigationRailKey});

  bool hiddenNavigation = false;
  bool contactButtonExtended = true;

  @override
  void initState() {
    contactButtonExtended = true;
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    hiddenNavigation = !ScreenSize.isDesktop(context);
  }

  _switchContactButtonState() {
    setState(() {
      contactButtonExtended = !contactButtonExtended;
    });
  }

  _switchNavigatorRailState() {
    setState(() {
      hiddenNavigation = !hiddenNavigation;
      navigationRailKey.currentState?..extendNavigationRail();
      navigationRailKey.currentState?..closeRail();
    });
  }

  @override
  Widget build(BuildContext context) {
    final customNavigationRail = CustomNavigationRail(
      key: navigationRailKey,
      child: child,
    );

    return Scaffold(
        // key: scaffoldKey,
        backgroundColor: Colors.black87,
        body: RawMaterialButton(
            mouseCursor: SystemMouseCursors.basic,
            onPressed: () => navigationRailKey.currentState?..closeRail(),
            child: customNavigationRail),
        // floatingActionButtonAnimator: ,
        floatingActionButton: floatingActionButtons(
          switchNavigatorRailState: _switchNavigatorRailState,
          switchContactButtonState: _switchContactButtonState,
          hiddenNavigation: hiddenNavigation,
          contactButtonExtended: contactButtonExtended,
        ));
  }
}
