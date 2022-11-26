import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

import 'custom_icon_button.dart';

/// A button to allow users to support me if they feel inspired to..
class DonationButton extends StatelessWidget {
  const DonationButton({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomIconButton(
      icon: Icons.favorite_rounded,
      tooltip: 'Support the developer!',
      onPressed: () {
        launchUrl(Uri(scheme: 'https', host: 'ko-fi.com', path: 'theguyhere'));
      },
    );
  }
}
