import 'package:url_launcher/url_launcher.dart';

void downloadResume({required String fileName}) {
  launchUrl(
    Uri.parse(fileName), // Directly points to web/resume.pdf
    mode: LaunchMode.externalApplication,
    webOnlyWindowName: '_blank',
  );
}
