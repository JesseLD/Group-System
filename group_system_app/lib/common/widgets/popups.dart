import 'package:flutter/material.dart';

void showMessagePopup(BuildContext context,String title, String message) {
  showDialog(
    context: context,
    builder: (_) {
      return AlertDialog(
        title: Text("$title"),
        content: Text("$message"),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            child: Text("OK"),
          ),
        ],
      );
    },
  );
}


void showUpdatePopup(BuildContext context,String title, String message) {
  showDialog(
    context: context,
    barrierDismissible: true,
    builder: (_) {
      return PopScope(
        canPop: false,
        child: AlertDialog(
          title: Text("$title"),
          content: Text("$message"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: Text("OK"),
            ),
          ],
        ),
      );
    },
  );
}
