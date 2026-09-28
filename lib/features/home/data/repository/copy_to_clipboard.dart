import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

Future<void> copyToClipboard(
  BuildContext context,
  String text, {
  String? successMessage,
}) async {
  // Copy to OS clipboard
  await Clipboard.setData(ClipboardData(text: text));

  // Give visual feedback to the user
  if (context.mounted) {
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(successMessage ?? 'Copied "$text" to clipboard!'),
        behavior: SnackBarBehavior.floating,
        duration: const Duration(milliseconds: 2000),
        width: 320,
      ),
    );
  }
}
