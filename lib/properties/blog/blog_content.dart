import 'package:flutter/material.dart';
import '../../ui/components/article_item.dart';

class BlogContents extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ArticleItem(
          thumbnail: Container(
            //width: 200,
            //height: 133,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/children.jpg"),
                fit: BoxFit.cover,
              ),
              // border: Border(
              //     bottom: BorderSide(width: 1)
              // )
            ),
          ),
          title:
              'How Japanese People Stay Fit for Life, Without Ever Visiting a Gym',
          subtitle: 'For people stressed or intimidated by fitness culture',
          author: 'Kaki Okumura',
          publishDate: 'Dec 28',
          readDuration: '5 mins',
          avatarLink:
              'https://miro.medium.com/fit/c/56/56/1*HQTxFkIf5fymNTatLc0qjA.jpeg',
          key: ValueKey(
              'How Japanese People Stay Fit for Life, Without Ever Visiting a Gym'),
        ),
        ArticleItem(
          thumbnail: Container(
            //width: 200,
            //height: 133,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/book.jpg"),
                fit: BoxFit.cover,
              ),
              // border: Border(
              //     bottom: BorderSide(width: 1)
              // )
            ),
          ),
          title:
              'This Simple but Brilliant Calendar Hack From Shopify’s CEO Will Make Your 2021 Much More Productive',
          subtitle:
              'It doesn’t matter how much work you squeeze in if you’re not working on the right things',
          author: 'inc. magazine',
          publishDate: 'Feb 26',
          readDuration: '12 mins',
          avatarLink:
              'https://miro.medium.com/fit/c/96/96/1*be9NhtCEZu-AB_zt2J46dg.jpeg',
          key: ValueKey(
              'This Simple but Brilliant Calendar Hack From Shopify’s CEO Will Make Your 2021 Much More Productive'),
        ),
        ArticleItem(
          thumbnail: Container(
            //width: 200,
            //height: 133,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage("images/1QmAkvn6tPCqaps5pJc2N4w.jpeg"),
                fit: BoxFit.cover,
              ),
              // border: Border(
              //     bottom: BorderSide(width: 1)
              // )
            ),
          ),
          title: 'Japan’s Steel Penis Festival.',
          subtitle:
              'A brief history behind the “Festival of the Steel Phallus.”',
          author: 'Ben Kageyama',
          publishDate: 'Jan 4',
          readDuration: '3 min read',
          avatarLink:
              'https://miro.medium.com/fit/c/96/96/1*IMgPKmEYKITsEEZeW2jipw.gif',
          key: ValueKey('Japan’s Steel Penis Festival.'),
        ),
        Container(
          height: 400,
        ),
      ],
    );
  }
}
