import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../models/project_controller.dart';
import '../common/cards/small_card.dart';
import '../common/card_tiles/text_field_card_tile.dart';
import '../common/card_tiles/list_card_tile.dart';

/// A card for managing the settings for time units of the project.
class TimeUnitSettingsCard extends ConsumerWidget {
  const TimeUnitSettingsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final name = ref.watch(projectControllerProvider).timeUnitName;

    return SmallCard(
      'Time Unit Settings',
      infoContent:
          'Set how time units behave in this project. Labels provide a descriptor for time units (ex. Monday, Spring 2022). All settings are optional or have default values.',
      content: Column(children: <Widget>[
        TextFieldCardTile(
          'Name',
          hintText: 'Time Unit',
          value: name,
          onChanged: (newValue) => ref
              .read(projectControllerProvider.notifier)
              .updateTimeUnitName(newValue),
        ),
        TextFieldCardTile(
          'Plural Form',
          hintText: '${name.isEmpty ? 'Time Unit' : name}s',
          value: ref.watch(projectControllerProvider).timeUnitPluralName,
          onChanged: (newValue) => ref
              .read(projectControllerProvider.notifier)
              .updateTimeUnitPluralName(newValue),
        ),
        const ListCardTile(title: 'Labels')
      ]),
    );
  }
}
