import 'package:flutter/material.dart';

Future<void> showMessageDialog(
  BuildContext context,
) async {
  return showDialog<void>(
    context: context,
    barrierDismissible: true, // user must tap button!
    builder: (
      BuildContext context,
    ) {
      return AlertDialog(
        title: const Text('In Development...'),
        content: const Text(
          "The feature that you're trying to access is currently in development. We're building it as you are seeing this.",
        ),
        contentTextStyle: Theme.of(context).textTheme.bodyText1,
        actions: <Widget>[
          ElevatedButton(
            onPressed: () {
              Navigator.of(context).pop();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: Colors.blue,
              foregroundColor: Colors.white,
              elevation: 0.0,
              shape: const RoundedRectangleBorder(
                borderRadius: BorderRadius.all(
                  Radius.circular(5.0),
                ),
              ),
              textStyle: Theme.of(context).textTheme.button,
            ),
            child: const Text('Dismiss'),
          ),
        ],
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            5.0,
          ),
        ),
      );
    },
  );
}
