import 'dart:core';

import 'package:flutter/material.dart';
import 'package:flutter_display_layer_framework/framework.dart';

class Article extends StatelessWidget with SingleWindowInterfaceMixin {
  final String path;

  Article({required this.path});

  @override
  Widget build(BuildContext context) => contents[path]!;

  @override
  bool scrollable() => true;
}

class Content1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'How Japanese People Stay Fit for Life, Without Ever Visiting a Gym',
          softWrap: true,
          style: TextStyle(
            color: Colors.black,
            fontSize: 46,
          ),
        ),
        Text(
          'For people stressed or intimidated by fitness culture',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 22,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            FittedBox(
              fit: BoxFit.fill,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.lightBlue,
                backgroundImage: NetworkImage(
                    'https://miro.medium.com/fit/c/56/56/1*HQTxFkIf5fymNTatLc0qjA.jpeg'),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Kaki Okumura',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: '    Nov 6, 2020·4 min read',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              width: 600,
              height: 465,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/shoes.jpg"),
                  fit: BoxFit.cover,
                ),
// border: Border(
//     bottom: BorderSide(width: 1)
// )
              ),
            ),
            SizedBox(
              height: 50,
            ),
            Text(
                "In the United States, I’m often bombarded with images and ads of fitness culture. "
                "Athleisure is the craze, and it seems that the majority of people are members "
                "of gyms like Anytime Fitness, 24 Hour Fitness, or LA Fitness. Any decent hotel or typical "
                "college campus has free access to a gym, sometimes even offering workout clothes for rental."
                "It’s the land of Alo Yoga and the birthplace to Crossfit. The most successful online influencers "
                "write about fitness, and it’s not uncommon to see "
                "someone share their workout on social media as they would their food.\n\n"
                "But in contrast to that, for a country that is a leader in longevity and has very low rates of "
                "obesity — the least among high-income developed nations at 4.3% — "
                "you might be surprised to find that there is not much of a workout culture in Japan. "
                "Athleisure is not a big thing, and not many people have a membership to a gym. "
                "People would rarely use their lunch break for a gym session, "
                "and those who do are probably seen as exercise zealots.\n\n"
                "In a recent Rakuten Insight survey of 1000 Japanese citizens ages 20 to their 60s, "
                "about half of those questioned revealed that they barely exercised, "
                "about once a month or not at all. Citing not enough time or simply that "
                "they don’t like exercising that much, most people just "
                "didn’t see working out as part of their lifestyle.\n\n"
                "What’s going on here?",
                softWrap: true,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 21,
                )),
            Container(
              width: 600,
              height: 465,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/1.jpg"),
                  fit: BoxFit.cover,
                ),
// border: Border(
//     bottom: BorderSide(width: 1)
// )
              ),
            ),
            Text(
              'What Exercise Looks Like in Japan',
              softWrap: true,
              style: TextStyle(
                color: Colors.black,
                fontSize: 36,
              ),
            ),
            Text(
                "If you take a closer look as to what exercise means to Japanese people, "
                "you’ll find that exercise equates working out. But perhaps exercise "
                "can take on forms that aren’t necessarily about going to a gym and "
                "lifting weights, or going on 10km runs. Namely, perhaps the exercise "
                "we need is the kind of exercise that is weaved into our lifestyle: walking.\n\n"
                "What the above results show is not that exercise isn’t important to be healthy, "
                "but that in Japan’s approach to moving, perhaps most don’t see it as exercise. "
                "Japanese adults walk an average of 6500 steps a day, with male adults in their "
                "20s to 50s walking nearly 8000 steps a day on average, and women in their "
                "20s to 50s about 7000 steps. Okinawans in particular are well-known for their "
                "walking culture, being especially mindful about incorporating movement in their "
                "daily lifestyle. Nagano, a rural prefecture in Japan, was able to flip their high "
                "stroke rate by incorporating over 100 walking routes, and now their citizens enjoy "
                "the highest rates of longevity in the country.\n\n"
                "Most Japanese citizens live in very walkable cities where public transportation is "
                "convenient, safe, and affordable, and not many households own cars. As a consequence, "
                "when most people go to work, they walk. When people go grocery shopping, they "
                "walk. When people are going out for dinner, they walk. It’s an activity adopted "
                "every day by every generation: walking is a part of daily life like breathing is.\n\n",
                softWrap: true,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 21,
                )),
            Text(
              'The Steps to Better Lifelong Health',
              softWrap: true,
              style: TextStyle(
                color: Colors.black,
                fontSize: 36,
              ),
            ),
            Text(
                "This is not a call against working out. I love working out, and spend a few "
                "hours a week running, biking, swimming, and completing calisthenic exercises. "
                "I don’t doubt the advantages of a good sweat, and find that it boosts both "
                "my physical and mental health.\n\n"
                "But fitness culture can feel overwhelming "
                "for those who aren’t used to it, and too much can perpetuate cycles of shame "
                "and guilt. It can make us believe that reaching and maintaining a healthy "
                "weight is only available to the dedicated ones who consistently lift weights "
                "and are making enough time for daily runs.\n\n"
                "Instead what this shows is that, "
                "like how eating healthfully doesn’t need to be eating only salads, healthful "
                "exercise doesn’t need to be only working out — the lifestyle fitness you need "
                "may just be in a bit more walking",
                softWrap: true,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 21,
                )),
            Container(
              width: 500,
              height: 310,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/2.jpg"),
                  fit: BoxFit.cover,
                ),
// border: Border(
//     bottom: BorderSide(width: 1)
// )
              ),
            ),
          ],
        )
      ],
    );
  }
}

class Content2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'This Simple but Brilliant Calendar Hack From Shopify’s CEO Will Make Your 2021 Much More Productive',
          softWrap: true,
          style: TextStyle(
            color: Colors.black,
            fontSize: 46,
          ),
        ),
        Text(
          'It doesn’t matter how much work you squeeze in if you’re not working on the right things',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 22,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            FittedBox(
              fit: BoxFit.fill,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.lightBlue,
                backgroundImage: NetworkImage(
                    'https://miro.medium.com/fit/c/96/96/1*be9NhtCEZu-AB_zt2J46dg.jpeg'),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'inc. magazine',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: '    Dec 25, 2020 · 3 min read',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              width: 600,
              height: 465,
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
            SizedBox(
              height: 50,
            ),
          ],
        )
      ],
    );
  }
}

class Content3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          'Japan’s Steel Penis Festival',
          softWrap: true,
          style: TextStyle(
            color: Colors.black,
            fontSize: 46,
          ),
        ),
        Text(
          'A brief history behind the “Festival of the Steel Phallus.”',
          style: TextStyle(
            color: Colors.black54,
            fontSize: 22,
          ),
        ),
        SizedBox(
          height: 10,
        ),
        Row(
          children: [
            FittedBox(
              fit: BoxFit.fill,
              child: CircleAvatar(
                radius: 10,
                backgroundColor: Colors.lightBlue,
                backgroundImage: NetworkImage(
                    'https://miro.medium.com/fit/c/96/96/1*IMgPKmEYKITsEEZeW2jipw.gif'),
              ),
            ),
            SizedBox(
              width: 10,
            ),
            RichText(
              text: TextSpan(
                children: <TextSpan>[
                  TextSpan(
                    text: 'Ben Kageyama',
                    style: TextStyle(
                      color: Colors.green,
                      fontSize: 14,
                    ),
                  ),
                  TextSpan(
                    text: '    Jan 4·3 min read',
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: 14,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50,
            ),
            Container(
              width: 600,
              height: 465,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/1QmAkvn6tPCqaps5pJc2N4w.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                'Kanamara Matsuri Festivities (2007), by Saya M., CC BY-SA 2.0 via Wikimedia Commons',
                softWrap: true,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              'Penis sausages, penis candies, penis costumes, and penis parades — all things one would probably come across when attending Japan’s Kanamara Matsuri festival. When literally translated, the Japanese phrase approximates to “Steel Phallus Festival” in English, and it’s just as exciting as it sounds.',
              softWrap: true,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ), //paragraph1
            SizedBox(
              height: 10,
            ),
            Text(
                "During the first Sunday of April, the streets of Kawasaki, Japan, are filled with penis praising activities for bringing honor to the Shinto spirits venerated at the Kanayama Shrine. The penis festival was formalized only in 1969 but had its roots in Japanese folklore and ancient beliefs.",
                softWrap: true,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                )),
            SizedBox(
              height: 30,
            ),
            Text(
              'History',
              softWrap: true,
              style: TextStyle(
                color: Colors.black,
                fontSize: 36,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 525,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/17tljQ5ZzjsJ6XCx5pJuH-Q.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                'Kanayama Shrine, by Stealth3327, CC BY 3.0 via Wikimedia Commons',
                softWrap: true,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              'Japanese folklore tells of a story of a demon that took residence inside the vagina of a young woman. The demon was motivated by love, obsessed with not letting other men experience carnal knowledge of her. Its jealousy was so strong that young men had their penises ripped off when they tried to have sex with the woman on two occasions.',
              softWrap: true,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'To combat the obsessive demon, the woman sought the aid of a known blacksmith. He made the woman a blessed iron phallus to break the demon’s teeth, allowing her to be rid of it forever. The ploy worked, and to give thanks to the spirits that blessed it, the phallus is now forever enshrined at Kawasaki’s Kanayama Shrine.',
              softWrap: true,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Unlike more conservative religions, Shintoism is more open to sex and sensual symbols. The legend behind Kanayam Shrine made the temple a place where people could pray for fertility and a more fulfilling married life. By the 17th to the 19th century, sex workers from brothels all over Japan made their way to the site to pray for protection or healing from sexually transmitted diseases.',
              softWrap: true,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'There is evidence of similar sex-oriented festivals in the area, but most were discontinued by the end of the 19th century. A century later, the practice was resurrected by local politicians, although at a much smaller scale than it is today.',
              softWrap: true,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                "In 2012, there was a sharp erection in the popularity of the Steel Phallus festival. Matsuko Deluxe, a big Japanese TV personality who was a big advocate for LGBTQ rights, endorsed the event that year, and since then, the festival has had over 50,000 attendees in every celebration that followed.",
                softWrap: true,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                )),
            SizedBox(
              height: 30,
            ),
            Text(
              'Festivities',
              softWrap: true,
              style: TextStyle(
                color: Colors.black,
                fontSize: 36,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 700,
              height: 1050,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/1bq7M4uhWZCpsAFzjLIFD_A.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                'Kanamara Boat Mikoshi, by stealth3327, Public Domain via Wikimedia Commons',
                softWrap: true,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              'The Kanamara Matsuri focuses its festivities around the procession of three moveable shrines.',
              softWrap: true,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'The first shrine is called the “Kanamara Mikoshi,” and it is the oldest among the three. It houses a wooden phallus within a square base and a roof.',
              softWrap: true,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'Amongst the stalls, the crowd, and tourists, one would also find the “Kanamara Boat Mikoshi.” This portable shrine hosts a black glowing iron phallus within a shrine shaped like a ship.',
              softWrap: true,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'The most prominent of the three floats is the “Elizabeth Mikoshi.” This shrine houses a giant pink penis donated by Kawasaki’s own cross-dressing club. During the festival itself, this huge pink phallus was carried exclusively by proud members of the drag club. Now, even non-members can carry the iconic shrine, although cross-dressing when doing so is still a requirement.',
              softWrap: true,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              'Final thoughts',
              softWrap: true,
              style: TextStyle(
                color: Colors.black,
                fontSize: 36,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              width: 700,
              height: 525,
              decoration: BoxDecoration(
                image: DecorationImage(
                  image: AssetImage("images/1r1CYsp6p_CQ-W7BnM_KT3A.jpeg"),
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
                'Penis candy from the festival, by stealth3327, Public Domain via Wikimedia Commons',
                softWrap: true,
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16,
                )),
            SizedBox(
              height: 10,
            ),
            Text(
              'The Kanamara Matsuri focuses its festivities around the procession of three moveable shrines.',
              softWrap: true,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'I think it’s pretty cool how old folklore has transformed into this unique experience. What’s amazing is that the community doesn’t just leave it up to the spirits to find cures against STDs. Proceeds from the festival are regularly donated to organizations that try to find treatments for HIV.',
              softWrap: true,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              'If you get the chance, you should definitely come by',
              softWrap: true,
              style: TextStyle(
                color: Colors.black,
                fontSize: 20,
              ),
            ),
            SizedBox(
              height: 100,
            ),
          ],
        )
      ],
    );
  }
}

final list = [
  Column(
    children: [
      SizedBox(
        height: 50,
      ),
      Container(
        width: 600,
        height: 465,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/shoes.jpg"),
            fit: BoxFit.cover,
          ),
// border: Border(
//     bottom: BorderSide(width: 1)
// )
        ),
      ),
      SizedBox(
        height: 50,
      ),
      Text(
          "In the United States, I’m often bombarded with images and ads of fitness culture. "
          "Athleisure is the craze, and it seems that the majority of people are members "
          "of gyms like Anytime Fitness, 24 Hour Fitness, or LA Fitness. Any decent hotel or typical "
          "college campus has free access to a gym, sometimes even offering workout clothes for rental."
          "It’s the land of Alo Yoga and the birthplace to Crossfit. The most successful online influencers "
          "write about fitness, and it’s not uncommon to see "
          "someone share their workout on social media as they would their food.\n\n"
          "But in contrast to that, for a country that is a leader in longevity and has very low rates of "
          "obesity — the least among high-income developed nations at 4.3% — "
          "you might be surprised to find that there is not much of a workout culture in Japan. "
          "Athleisure is not a big thing, and not many people have a membership to a gym. "
          "People would rarely use their lunch break for a gym session, "
          "and those who do are probably seen as exercise zealots.\n\n"
          "In a recent Rakuten Insight survey of 1000 Japanese citizens ages 20 to their 60s, "
          "about half of those questioned revealed that they barely exercised, "
          "about once a month or not at all. Citing not enough time or simply that "
          "they don’t like exercising that much, most people just "
          "didn’t see working out as part of their lifestyle.\n\n"
          "What’s going on here?",
          softWrap: true,
          style: TextStyle(
            color: Colors.black,
            fontSize: 21,
          )),
      Container(
        width: 600,
        height: 465,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/1.jpg"),
            fit: BoxFit.cover,
          ),
// border: Border(
//     bottom: BorderSide(width: 1)
// )
        ),
      ),
      Text(
        'What Exercise Looks Like in Japan',
        softWrap: true,
        style: TextStyle(
          color: Colors.black,
          fontSize: 36,
        ),
      ),
      Text(
          "If you take a closer look as to what exercise means to Japanese people, "
          "you’ll find that exercise equates working out. But perhaps exercise "
          "can take on forms that aren’t necessarily about going to a gym and "
          "lifting weights, or going on 10km runs. Namely, perhaps the exercise "
          "we need is the kind of exercise that is weaved into our lifestyle: walking.\n\n"
          "What the above results show is not that exercise isn’t important to be healthy, "
          "but that in Japan’s approach to moving, perhaps most don’t see it as exercise. "
          "Japanese adults walk an average of 6500 steps a day, with male adults in their "
          "20s to 50s walking nearly 8000 steps a day on average, and women in their "
          "20s to 50s about 7000 steps. Okinawans in particular are well-known for their "
          "walking culture, being especially mindful about incorporating movement in their "
          "daily lifestyle. Nagano, a rural prefecture in Japan, was able to flip their high "
          "stroke rate by incorporating over 100 walking routes, and now their citizens enjoy "
          "the highest rates of longevity in the country.\n\n"
          "Most Japanese citizens live in very walkable cities where public transportation is "
          "convenient, safe, and affordable, and not many households own cars. As a consequence, "
          "when most people go to work, they walk. When people go grocery shopping, they "
          "walk. When people are going out for dinner, they walk. It’s an activity adopted "
          "every day by every generation: walking is a part of daily life like breathing is.\n\n",
          softWrap: true,
          style: TextStyle(
            color: Colors.black,
            fontSize: 21,
          )),
      Text(
        'The Steps to Better Lifelong Health',
        softWrap: true,
        style: TextStyle(
          color: Colors.black,
          fontSize: 36,
        ),
      ),
      Text(
          "This is not a call against working out. I love working out, and spend a few "
          "hours a week running, biking, swimming, and completing calisthenic exercises. "
          "I don’t doubt the advantages of a good sweat, and find that it boosts both "
          "my physical and mental health.\n\n"
          "But fitness culture can feel overwhelming "
          "for those who aren’t used to it, and too much can perpetuate cycles of shame "
          "and guilt. It can make us believe that reaching and maintaining a healthy "
          "weight is only available to the dedicated ones who consistently lift weights "
          "and are making enough time for daily runs.\n\n"
          "Instead what this shows is that, "
          "like how eating healthfully doesn’t need to be eating only salads, healthful "
          "exercise doesn’t need to be only working out — the lifestyle fitness you need "
          "may just be in a bit more walking",
          softWrap: true,
          style: TextStyle(
            color: Colors.black,
            fontSize: 21,
          )),
      Container(
        width: 500,
        height: 310,
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage("images/2.jpg"),
            fit: BoxFit.cover,
          ),
// border: Border(
//     bottom: BorderSide(width: 1)
// )
        ),
      ),
    ],
  )
];

var contents = {
  'How-Japanese-People-Stay-Fit-for-Life-Without-Ever-Visiting-a-Gym':
      Content1(),
  'This-Simple-but-Brilliant-Calendar-Hack-'
      'From-Shopify’s-CEO-Will-Make-Your-2021-Much-More-Productive': Content2(),
  'Japan’s-Steel-Penis-Festival.': Content3(),
};
