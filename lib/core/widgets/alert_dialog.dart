import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:my_portfolio/core/widgets/progress_indicator_static.dart';
import 'package:my_portfolio/core/widgets/text.dart';

/// [onPressed] is a callback function (){}
/// A Dialog that is primary used for decision making (Yes/No)
/// But can be used for other things too, just pass an appropriate widget into [contentWidget]
///
/// [isUsedAsInfoDialogOnly] is a boolean that determines if the dialog is an information dialog or a decision making dialog. If true, the dialog will only have an "Acknowledged" button.
void myAlertDialogue({
  required BuildContext context,
  String alertTitle = "Alert",
  String alertContent = "",
  Color? barrierColor,
  bool isDismissible = true,
  required VoidCallback onApprovalPressed,
  String onApprovalButtonText = "Yes",
  Widget? contentWidget,
  // Color onApprovalButtonColor = MyColorPalette.splashColor,
  Color onApprovalButtonColor = const Color.fromARGB(255, 26, 139, 232),
  Color onApprovalButtonTextColor = Colors.white,
  String onCancelButtonText = "No",
  bool isUsedAsInfoDialogOnly = false,
  bool isLoading = false,
}) {
  showCupertinoDialog(
    barrierColor: barrierColor,
    context: context,
    barrierDismissible: isDismissible,
    builder: (context) {
      return CupertinoAlertDialog(
        title: Text(alertTitle, style: TextStyle(fontFamily: "Quicksand")),
        content: Column(
          children: [
            if (contentWidget != null) SizedBox(height: 8),
            ?contentWidget,
            Text(alertContent, style: TextStyle(fontFamily: "Quicksand")),
          ],
        ),

        actions: [
          CupertinoDialogAction(
            onPressed: () {
              Navigator.pop(context);
            },
            child: MyText(
              text: (!isUsedAsInfoDialogOnly)
                  ? onCancelButtonText
                  : "Acknowledged",
              // color: Colors.grey.shade800,
            ),
          ),
          if (!isUsedAsInfoDialogOnly)
            (!isLoading)
                ? CupertinoDialogAction(
                    onPressed: onApprovalPressed,
                    child: MyText(
                      text: onApprovalButtonText,
                      color: onApprovalButtonColor,
                      fontWeight: FontWeight.w600,
                      fontSize: kDefaultFontSize + 2.5,
                    ),
                  )
                : Center(
                    child: SizedBox(
                      width: 24,
                      height: 24,
                      child: MyProgressIndicator(),
                    ),
                  ),
        ],
      );
    },
  );
}
