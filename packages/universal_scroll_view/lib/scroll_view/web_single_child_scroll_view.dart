import 'dart:developer';

import 'package:after_layout/after_layout.dart';
import 'package:flutter/material.dart';
import 'package:universal_html/html.dart' as html;

class WebSingleChildScrollView extends StatefulWidget {
  final Widget child;

  WebSingleChildScrollView({Key? key, required this.child})
      : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return WebSingleChildScrollViewState(child);
  }
}

class WebSingleChildScrollViewState
    extends State<WebSingleChildScrollView>
    with AfterLayoutMixin<WebSingleChildScrollView> {
  final Widget child;

  WebSingleChildScrollViewState(this.child);

  final target = html.querySelector('flt-scene-host');
  final scrollFrame = new html.DivElement();
  final offsetElement = new html.DivElement();
  late ScrollController _scrollController;

  double _height = 0;

  _scrollListener() {
    // log(
    //     '_scrollListener.position.pixels = {' +
    //         scrollFrame.scrollTop.toString() +
    //         ',' +
    //         _scrollController.position.pixels.toInt().toString() +
    //         '}',
    //     name: 'ml.numflurry.BrowserScrollViewState');
    // // if (_scrollController.position.hasPixels)
    // log(
    //     '_scrollController.position.maxScrollExtent  = ' +
    //         _scrollController.position.maxScrollExtent.toString(),
    //     name: 'ml.numflurry.BrowserScrollViewState');
    // log(
    //     '_scrollController.position.extentInside = ' +
    //         _scrollController.position.extentInside.toString(),
    //     name: 'ml.numflurry.BrowserScrollViewState');

    if (_height != _scrollController.position.maxScrollExtent) {
      _height = _scrollController.position.maxScrollExtent;

      log(
          '_scrollListener.js.setHeight = ' +
              (_height + _scrollController.position.extentInside).toString(),
          name: 'ml.numflurry.BrowserScrollViewState');

      offsetElement.setAttribute(
          'style',
          'width: 100%; height: ' +
              (_scrollController.position.maxScrollExtent +
                      _scrollController.position.extentInside -
                      17)
                  .toString() +
              'px;');
    }

    log('scrollFrame.scrollTop = ' + scrollFrame.scrollTop.toString(),
        name: 'ml.numflurry.BrowserScrollViewState');
    log(
        '_scrollController.position.pixels.toInt() = ' +
            _scrollController.position.pixels.toInt().toString(),
        name: 'ml.numflurry.BrowserScrollViewState');
    if (!_scrollController.position.outOfRange) {
      scrollFrame.scrollTop = _scrollController.offset.toInt();
    }
  }

  @override
  void initState() {
    _scrollController = new ScrollController();
    log('initState', name: 'ml.numflurry.BrowserScrollViewState');
    _scrollController.addListener(_scrollListener);
    scrollFrame.id = this.hashCode.toString();
    scrollFrame.setAttribute(
        'style', 'width: 100%; height: 100%; overflow: scroll;');
    scrollFrame.append(offsetElement);
    scrollFrame.addEventListener('scroll', (event) {
      // log(
      //     'scrollFrame.scrollHeight = {' +
      //         scrollFrame.scrollTop.toString() +
      //         ',' +
      //         _scrollController.position.pixels.toInt().toString() +
      //         '}',
      //     name: 'ml.numflurry.BrowserScrollViewState');

      if (!_scrollController.position.outOfRange &&
          scrollFrame.scrollTop != _scrollController.position.pixels.toInt()) {
        _scrollController.position.jumpTo(scrollFrame.scrollTop.toDouble());
      }
    });
    target!.after(scrollFrame);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      controller: _scrollController,
      child: child,
    );
  }

  @override
  void didUpdateWidget(
      covariant WebSingleChildScrollView oldWidget) {
    super.didUpdateWidget(oldWidget);
  }

  @override
  void afterFirstLayout(BuildContext context) {
    log('afterFirstLayout', name: 'ml.numflurry.BrowserScrollViewState');
    _scrollController.position.jumpTo(1);
    _scrollController.position.jumpTo(-1);
    offsetElement.setAttribute(
        'style',
        'width: 100%; height: ' +
            (_scrollController.position.maxScrollExtent +
                    _scrollController.position.extentInside -
                    17)
                .toString() +
            'px;');
  }

  @override
  void dispose() {
    log('disposed', name: 'ml.numflurry.BrowserScrollViewState');
    offsetElement.remove();
    scrollFrame.remove();
    _scrollController.dispose();
    super.dispose();
  }
}
