import 'package:flutter/material.dart';

import '../router/router.dart';

Future<bool> showConfirmDialog(String title, String content) async {
  final globalContext = navigatorKey.currentState?.overlay?.context;

  if (globalContext == null) {
    return false;
  }

  return showDialog<bool?>(
    context: globalContext,
    barrierDismissible: true,
    builder: (BuildContext context) {
      return AlertDialog(
        title: Text(title),
        content: Text(content),
        actions: <Widget>[
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(false);
            },
            child: const Text('취소'),
          ),
          TextButton(
            onPressed: () {
              Navigator.of(context).pop(true);
            },
            child: const Text('확인'),
          ),
        ],
      );
    },
  ).then((value) => value ?? false);
}
