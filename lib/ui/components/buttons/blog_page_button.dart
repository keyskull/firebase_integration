
import 'package:flutter/material.dart';
import 'package:router/path_handler.dart';
import 'package:provider/provider.dart';

class BlogTopicChips extends StatefulWidget {


  @override
  _BlogTopicChipsState createState() => _BlogTopicChipsState();
}

class _BlogTopicChipsState extends State<BlogTopicChips> with RestorationMixin {
  final RestorableInt _indexSelected = RestorableInt(-1);

  @override
  String get restorationId => 'TagChips';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_indexSelected, 'TagChip');
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'DISCOVER MORE OF WHAT MATTERS TO YOU',
          style: TextStyle(fontWeight: FontWeight.values[5]),
        ),
        const Padding(padding: EdgeInsets.only(bottom: 10.0)),
        Wrap(
          spacing: 8.0,
          runSpacing: 8.0,
          children: [
            ChoiceChip(
              label:const Text('Self'),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),),
                borderRadius:const BorderRadius.all(Radius.circular(6)),
              ),
              selected: _indexSelected.value == 0,
              onSelected: (value) {
                setState(() {
                  _indexSelected.value = value ? 0 : -1;
                });
                const String path = 'Self';
                Provider.of<PathHandler>(context, listen: false).changePath(path);
              },
            ),
            //const SizedBox(width: 8),
            ChoiceChip(
              label: const Text('Relationships'),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),),
                borderRadius: const BorderRadius.all(Radius.circular(6)),
              ),
              selected: _indexSelected.value == 1,
              onSelected: (value) {
                setState(() {
                  _indexSelected.value = value ? 1 : -1;
                });
                const String path = 'Relationships';
                Provider.of<PathHandler>(context, listen: false).changePath(path);
              },
            ),
            //const SizedBox(width: 8),
            ChoiceChip(
              label: const Text('Data Science'),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),),
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              selected: _indexSelected.value == 2,
              onSelected: (value) {
                setState(() {
                  _indexSelected.value = value ? 2 : -1;
                });
                const String path = 'Data-Science';
                Provider.of<PathHandler>(context, listen: false).changePath(path);
              },
            ),
            //const SizedBox(width: 8),
            ChoiceChip(
              label: const Text('Programming'),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),),
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              selected: _indexSelected.value == 3,
              onSelected: (value) {
                setState(() {
                  _indexSelected.value = value ? 3 : -1;
                });
                const String path = 'Programming';
                Provider.of<PathHandler>(context, listen: false).changePath(path);
              },
            ),
            //const SizedBox(width: 8),
            ChoiceChip(
              label:const Text('Productivity'),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),),
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              selected: _indexSelected.value == 4,
              onSelected: (value) {
                setState(() {
                  _indexSelected.value = value ? 4 : -1;
                });
                const String path = 'Productivity';
                Provider.of<PathHandler>(context, listen: false).changePath(path);
              },
            ),
            //const SizedBox(width: 8),
            ChoiceChip(
              label:const Text('Javascript'),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),),
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              selected: _indexSelected.value == 5,
              onSelected: (value) {
                setState(() {
                  _indexSelected.value = value ? 5 : -1;
                });
                const String path = 'Javascript';
                Provider.of<PathHandler>(context, listen: false).changePath(path);
              },
            ),
            //const SizedBox(width: 8),
            ChoiceChip(
              label:const Text('Machine Learning'),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),),
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              selected: _indexSelected.value == 6,
              onSelected: (value) {
                setState(() {
                  _indexSelected.value = value ? 6 : -1;
                });
                const String path = 'Machine-Learning';
                Provider.of<PathHandler>(context, listen: false).changePath(path);
              },
            ),
            //const SizedBox(width: 8),
            ChoiceChip(
              label:const Text('Politics'),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),),
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              selected: _indexSelected.value == 7,
              onSelected: (value) {
                setState(() {
                  _indexSelected.value = value ? 7 : -1;
                });
                const String path = 'Politics';
                Provider.of<PathHandler>(context, listen: false).changePath(path);
              },
            ),
            //const SizedBox(width: 8),
            ChoiceChip(
              label:const Text('Health'),
              backgroundColor: Colors.transparent,
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1,
                  color: Theme.of(context).colorScheme.onSurface.withOpacity(0.12),),
                borderRadius: BorderRadius.all(Radius.circular(6)),
              ),
              selected: _indexSelected.value == 8,
              onSelected: (value) {
                setState(() {
                  _indexSelected.value = value ? 8 : -1;
                });
                const String path = 'Health';
                Provider.of<PathHandler>(context, listen: false).changePath(path);
              },
            ),
          ],
        ),
      ],
    );
  }
}
