import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> openLink(String url) async {
  final Uri uri = Uri.parse(url);
  if (!await launchUrl(
    uri,
    mode: LaunchMode.externalApplication,
    webOnlyWindowName: '_blank', // Opens in a new tab!
  )) {
    debugPrint('Could not launch $url');
  }
}
