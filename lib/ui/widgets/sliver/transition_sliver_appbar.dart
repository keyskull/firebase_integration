import 'dart:math' as math;

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:utilities/screen_size.dart';

typedef void OnPressed();

class TransitionSliverAppBar extends StatelessWidget {
  final Widget avatar;
  final Widget child;
  final Widget title;
  final double minHeight;
  final double maxHeight;
  final bool pinned;
  final bool floating;
  final Color backgroundColor;
  final OnPressed onPressed;
  final MouseCursor mouseCursors;

  const TransitionSliverAppBar(
      {Key? key,
      required this.avatar,
      required this.title,
      required this.child,
      this.floating = true,
      this.pinned = false,
      this.maxHeight = 500.0,
      this.minHeight = 60.0,
      required this.onPressed,
      this.mouseCursors = SystemMouseCursors.click,
      this.backgroundColor = Colors.blue})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverPersistentHeader(
      pinned: pinned,
      floating: floating,
      delegate: _TransitionAppBarDelegate(
          avatar: avatar,
          title: title,
          minHeight: minHeight,
          maxHeight: maxHeight,
          mouseCursors: mouseCursors,
          backgroundColor: backgroundColor,
          child: child,
          onPressed: onPressed),
    );
  }
}

class _TransitionAppBarDelegate extends SliverPersistentHeaderDelegate {
  static final _defaultAvatarSize = const Size(170.0, 170.0);

  final _avatarTween =
      SizeTween(begin: _defaultAvatarSize, end: const Size(0, 0));
  final _avatarAlignTween = AlignmentTween(
      begin: const Alignment(-0.99, 0.2), end: const Alignment(-1, 0));
  final _titleAlignTween =
      AlignmentTween(begin: const Alignment(0, -1), end: Alignment.center);
  final _backgroundColorTween =
      ColorTween(begin: Colors.teal, end: Colors.black38);

  final Widget avatar;
  final Widget title;
  final Widget child;
  final double minHeight;
  final double maxHeight;
  final Color backgroundColor;
  final OnPressed onPressed;
  final MouseCursor mouseCursors;

  _TransitionAppBarDelegate(
      {required this.avatar,
      required this.title,
      required this.child,
      required this.minHeight,
      required this.maxHeight,
      required this.backgroundColor,
      required this.mouseCursors,
      required this.onPressed})
      : assert(avatar != null);

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    final progress = shrinkOffset / 200.0;
    final avatarSize = _avatarTween.lerp(progress);
    final avatarAlign = _avatarAlignTween.lerp(progress);
    final titleAlign = _titleAlignTween.lerp(progress);
    final backgroundColor = _backgroundColorTween.lerp(progress);
    return Align(
        alignment: Alignment.centerLeft,
        child: RawMaterialButton(
            mouseCursor: mouseCursors,
            onPressed: onPressed,
            child: Container(
                color: backgroundColor,
                child: Stack(
                  fit: StackFit.expand,
                  children: <Widget>[
                    Align(
                      alignment: avatarAlign,
                      child: SizedBox.fromSize(size: avatarSize, child: avatar),
                    ),
                    Align(
                      alignment: titleAlign,
                      child: DefaultTextStyle(
                          style: Theme.of(context).textTheme.headline6!,
                          child: title),
                    ),
                    Positioned(
                        left: _defaultAvatarSize.width + 10,
                        top: 30,
                        child: Container(
                            alignment: Alignment.topLeft,
                            width: ScreenSize.getScreenSize.width -
                                _defaultAvatarSize.width -
                                20,
                            height: maxHeight - 40,
                            child: SizedBox.expand(
                              child: child,
                            ))),
                  ],
                ))));
  }

  @override
  double get maxExtent => math.max(maxHeight, minHeight);

  @override
  double get minExtent => minHeight;

  @override
  bool shouldRebuild(_TransitionAppBarDelegate oldDelegate) {
    return avatar != oldDelegate.avatar ||
        maxHeight != oldDelegate.maxHeight ||
        minHeight != oldDelegate.minHeight ||
        child != oldDelegate.child;
  }
}
