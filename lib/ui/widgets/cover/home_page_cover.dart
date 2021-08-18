import 'package:cullen/properties/common.dart';
import 'package:flutter/material.dart';
import 'package:localization/generated/l10n.dart';
import 'package:utilities/screen_size.dart';
import 'package:utilities/write_text.dart';

import '../sliver_list/sliver_appbar_delegate.dart';

homePageCover(
        {required BuildContext context,
        required ScrollController scrollController}) =>
    SliverAppBarDelegate(
      pinned: false,
      maxHeight: ScreenSize.getFlashScreenSize(context).height - appBarHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            decoration: BoxDecoration(
                color: Colors.black87,
                image: DecorationImage(
                  colorFilter:
                      ColorFilter.mode(Colors.black54, BlendMode.darken),
                  image: AssetImage("images/night.jpg"),
                  fit: BoxFit.cover,
                )),
          ),
          FittedBox(
            fit: BoxFit.fill,
            alignment: Alignment.bottomCenter,
            child: Container(
              constraints: BoxConstraints(
                  maxWidth: ScreenSize.getScreenSize.width * 0.8),
              child: WriteText(
                perMillSeconds: 150,
                textStyle: TextStyle(
                    fontSize: 40,
                    fontWeight: FontWeight.w600,
                    color: Colors.white),
                data: S.of(context).header_description,
              ),
            ),
          ),
          Align(
              alignment: Alignment.bottomCenter,
              child: MaterialButton(
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        S.of(context).more,
                        style: TextStyle(color: Colors.white),
                        textAlign: TextAlign.end,
                      ),
                      const Icon(
                        Icons.keyboard_arrow_down,
                        color: Colors.white,
                        size: 80,
                        textDirection: TextDirection.rtl,
                      ),
                    ]),
                onPressed: () => scrollController.animateTo(
                    ScreenSize.getScreenSize.height,
                    duration: const Duration(milliseconds: 1500),
                    curve: Curves.decelerate),
              ))
        ],
      ),
    );
