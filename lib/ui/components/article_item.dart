import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:router/path_handler.dart';

import '../../properties/common.dart';

RegExp exp = new RegExp(r'[ ,]+');

class ArticleDescription extends StatelessWidget {
  ArticleDescription({
    required Key key,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.publishDate,
    required this.readDuration,
    required this.avatarLink,
  }) : super(key: key);

  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;
  final String avatarLink;

  @override
  Widget build(BuildContext context) {
    String path;
    final _padding = const Padding(padding: const EdgeInsets.only(bottom: 5.0));
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        SizedBox(
          width: 442,
          height: 23,
          child: Row(
            children: [
              FittedBox(
                fit: BoxFit.fill,
                child: CircleAvatar(
                  radius: 10,
                  backgroundColor: Colors.lightBlue,
                  backgroundImage: NetworkImage(avatarLink),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              AutoSizeText(
                '$author',
                style: const TextStyle(
                  fontSize: 12.0,
                ),
              ),
            ],
          ),
        ),

        //_padding,
        SizedBox(
          width: 442,
          height: 56,
          child: TextButton(
            onPressed: () {
              path = title.replaceAll(exp, '-');
              path = 'blog/$path';
              Provider.of<PathHandler>(context, listen: false).changePath(path);
              //handler(path);
              //print (path);
            },
            child: AutoSizeText(
              '$title',
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 22,
              ),
            ),
          ),
        ),

        //_padding,
        SizedBox(
          width: 442,
          height: 40,
          child: AutoSizeText(
            '$subtitle',
            maxLines: 2,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(
              fontSize: 16.0,
              color: Colors.black54,
            ),
          ),
        ),
        _padding,
        AutoSizeText(
          '$publishDate - $readDuration',
          style: const TextStyle(
            fontSize: 12.0,
            color: Colors.black54,
          ),
        ),
      ],
    );
  }
}

class ArticleItem extends StatelessWidget {
  ArticleItem({
    required Key key,
    required this.thumbnail,
    required this.title,
    required this.subtitle,
    required this.author,
    required this.publishDate,
    required this.readDuration,
    required this.avatarLink,
  }) : super(key: key);

  final Widget thumbnail;
  final String title;
  final String subtitle;
  final String author;
  final String publishDate;
  final String readDuration;
  final String avatarLink;

  @override
  Widget build(BuildContext context) {
    return Padding(
      //padding: const EdgeInsets.symmetric(vertical: 20.0),
      //padding: ConstantAny.edgeInsetsAll,
      // padding: screensize.width > 850?
      // const EdgeInsets.only(left: 20, right: 536, bottom: 20) : const EdgeInsets.only(left: 20,  bottom: 20),
      padding: const EdgeInsets.only(left: 20, bottom: 30),
      child: SizedBox(
        width: 664,
        height: 150,
        //height: ConstantAny.articleItemHeight,
        child: Row(
          //crossAxisAlignment: ConstantAny.articleItemAlignment,
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            // AspectRatio(
            //   aspectRatio: 200 / 133,
            //   child: thumbnail,
            // ),
            Flexible(
              child: AspectRatio(
                aspectRatio: 200 / 133,
                child: thumbnail,
              ),
              flex: 1,
            ),
            Flexible(
              child: Padding(
                padding: descriptionEdgeInsets,
                child: ArticleDescription(
                  title: title,
                  subtitle: subtitle,
                  author: author,
                  publishDate: publishDate,
                  readDuration: readDuration,
                  avatarLink: avatarLink,
                  key: ValueKey(title),
                ),
              ),
              flex: 2,
            ),
            // Expanded(
            //   child: Padding(
            //     padding:ConstantAny.descriptionEdgeInsets ,
            //     child: _ArticleDescription(
            //       title: title,
            //       subtitle: subtitle,
            //       author: author,
            //       publishDate: publishDate,
            //       readDuration: readDuration,
            //     ),
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
