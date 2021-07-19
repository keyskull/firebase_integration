// import 'package:flutter/material.dart';
// import 'package:flutter/rendering.dart';
// import 'package:pointer_interceptor/pointer_interceptor.dart';
// import 'package:router/route.dart';
// import 'package:url_launcher/url_launcher.dart';
// import 'package:utilities/screen_size.dart';
//
// import '../components/navigation_rail/custom_navigation_rail.dart';
// import 'dialogs/stackedit_dialog.dart';
//
// class NavigationLayer extends StatefulWidget {
//   final Widget child;
//   final GlobalKey<CustomNavigationRailState> navigationRailKey = GlobalKey();
//
//   NavigationLayer({required this.child});
//
//   @override
//   NavigationLayerState createState() =>
//       NavigationLayerState(child: child, navigationRailKey: navigationRailKey);
// }
//
// class NavigationLayerState extends State<NavigationLayer>
//     with TickerProviderStateMixin {
//   final Widget child;
//   final GlobalKey<CustomNavigationRailState> navigationRailKey;
//
//   NavigationLayerState({required this.child, required this.navigationRailKey});
//
//   bool hiddenNavigation = false;
//   bool contactButtonExtended = true;
//
//   @override
//   void initState() {
//     contactButtonExtended = true;
//     super.initState();
//   }
//
//   @override
//   void didChangeDependencies() {
//     super.didChangeDependencies();
//     hiddenNavigation = !ScreenSize.isDesktop(context);
//   }
//
//   _switchContactButtonState() {
//     setState(() {
//       contactButtonExtended = !contactButtonExtended;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       // key: scaffoldKey,
//       backgroundColor: Colors.black87,
//       body: RawMaterialButton(
//           mouseCursor: SystemMouseCursors.basic,
//           onPressed: () => navigationRailKey.currentState?..closeRail(),
//           child: CustomNavigationRail(
//             key: navigationRailKey,
//             child: child,
//           )),
//       // floatingActionButtonAnimator: ,
//       floatingActionButton: Opacity(
//         opacity: 0.7,
//         child: Stack(
//           alignment: Alignment.bottomRight,
//           children: [
//             Padding(
//                 padding: EdgeInsets.only(
//                     right: ScreenSize.getFlashScreenSize(context).width - 85),
//                 child: PointerInterceptor(
//                     child: FloatingActionButton(
//                   onPressed: () {
//                     setState(() {
//                       hiddenNavigation = !hiddenNavigation;
//                       navigationRailKey.currentState?..extendNavigationRail();
//                       navigationRailKey.currentState?..closeRail();
//                     });
//                   },
//                   child: hiddenNavigation
//                       ? Icon(Icons.arrow_forward_ios_outlined)
//                       : Icon(Icons.arrow_back_ios_outlined),
//                   heroTag: "hidden",
//                 ))),
//             Column(mainAxisAlignment: MainAxisAlignment.end, children: [
//               PointerInterceptor(
//                   child: FloatingActionButton(
//                 mini: true,
//                 onPressed: () {
//                   _switchContactButtonState();
//                   launch("mailto:contact@numflurry.ml");
//                 },
//                 child: contactButtonExtended
//                     ? Icon(Icons.email)
//                     : Icon(Icons.email_outlined),
//                 backgroundColor: Colors.blue,
//                 heroTag: "btn2",
//               )),
//               SizedBox(height: 10),
//               PointerInterceptor(
//                   child: FloatingActionButton(
//                 mini: true,
//                 onPressed: () {
//                   _switchContactButtonState();
//                   if (!contactButtonExtended)
//                     showDialog(
//                       context: globalNavigatorKey.currentContext!,
//                       builder: (context) => StackeditDialog(),
//                       useSafeArea: true,
//                       useRootNavigator: true,
//                     );
//                 },
//                 child: contactButtonExtended
//                     ? Icon(Icons.message)
//                     : Icon(Icons.message_outlined),
//                 backgroundColor: Colors.blue,
//               ))
//             ])
//           ],
//         ),
//       ),
//     );
//   }
// }
