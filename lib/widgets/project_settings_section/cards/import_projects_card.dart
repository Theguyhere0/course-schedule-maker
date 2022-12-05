import 'package:flutter/material.dart';

import '../../common/card_tiles/dropdown_card_tile.dart';
import '../../common/cards/small_card.dart';
import '../../common/card_tiles/button_card_tile.dart';
import '../../common/card_tiles/text_card_tile.dart';

/// A card for importing projects to work on.
class ImportProjectsCard extends StatelessWidget {
  const ImportProjectsCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmallCard(
      'Import Projects',
      infoContent:
          'Choose to import a project from a file or from default templates.',
      content: Column(children: const <Widget>[
        // Import a local file
        ButtonCardTile(
          'From Disk',
          icon: Icons.download_rounded,
        ),
        // Separator
        TextCardTile('OR'),
        // Use a template
        DropdownCardTile(
          'From Template',
          label: false,
          options: [],
          value: null,
        ),
      ]),
    );
  }
}
