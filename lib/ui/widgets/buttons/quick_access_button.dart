import 'package:flutter/material.dart';

class QuickAccessButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final _button = List.generate(
      10,
      (index) => ChoiceChip(
          label: Text("aaa"),
          selected: false,
          backgroundColor: Colors.teal,
          // shadowColor: Colors.transparent,

          onSelected: (value) {},
          labelPadding: EdgeInsets.symmetric(horizontal: 30, vertical: 5),
          // shape: RoundedRectangleBorder(
          //   borderRadius: BorderRadius.all(Radius.circular(6)),
          // )

      ),
    );

    return Wrap(
      spacing: 60,
      runSpacing: 10,
      children: _button,
    );
  }
}
