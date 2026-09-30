import 'package:flutter/foundation.dart';
import 'package:url_launcher/url_launcher.dart';

Future<void> sendEmail({
  required String email,
  String subject = '',
  String body = '',
}) async {
  // Standard mailto URI
  final Uri mailtoUri = Uri(
    scheme: 'mailto',
    path: email,
    queryParameters: {
      if (subject.isNotEmpty) 'subject': subject,
      if (body.isNotEmpty) 'body': body,
    },
  );

  try {
    // Attempt standard mailto with externalApplication mode
    final bool launched = await launchUrl(
      mailtoUri,
      mode: LaunchMode.externalApplication,
    );

    if (!launched) {
      _openGmailWeb(email: email, subject: subject, body: body);
    }
  } catch (_) {
    // If mailto protocol is blocked or unhandled on web, open Gmail directly!
    _openGmailWeb(email: email, subject: subject, body: body);
  }
}

/// Fallback: Opens Gmail compose in a browser tab (100% reliable on Web)
void _openGmailWeb({
  required String email,
  required String subject,
  required String body,
}) {
  final Uri gmailUri = Uri.parse(
    'https://mail.google.com/mail/?view=cm&fs=1&to=$email&su=${Uri.encodeComponent(subject)}&body=${Uri.encodeComponent(body)}',
  );
  launchUrl(
    gmailUri,
    mode: LaunchMode.externalApplication,
    webOnlyWindowName: '_blank',
  );
}
