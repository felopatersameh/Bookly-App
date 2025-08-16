import 'package:flutter/material.dart';

/// basic Tap
Future<void> pushNext(context, String screen, {Object? arguments}) async {
  await Navigator.pushNamed(context, screen, arguments: arguments);
}

// Future<void> pushNextInTask(context,ModelPost task ) async {
//   await Navigator.pushNamed(
//     context,
//     AppRoutes.taskRoute,
//     arguments: <String, dynamic>{
//       'task':task
//     },
//   );
// }Future<void> pushNextInAddItem(context,ModelPost task ) async {
//   await Navigator.pushNamed(
//     context,
//     AppRoutes.addItem,
//     arguments: <String, dynamic>{
//       'task':task
//     },
//   );
// }

Future<void> pushReplacement(context, String screen) async {
  await Navigator.pushReplacementNamed(context, screen);
}

Future<void> restorePushReplacement(context, String screen) async {
  Navigator.restorablePushReplacementNamed(context, screen);
}

Future<void> pushNextAndRemove(context, String screen) async {
  await Navigator.pushNamedAndRemoveUntil(context, screen, (route) => true);
}

void popScreen(context) {
  Navigator.pop(context);
}

void popHome(BuildContext context) {
  Navigator.popUntil(context, ModalRoute.withName('Home/'));
}

void popAndPush(context, String screen, {Object? arguments}) {
  Navigator.popAndPushNamed(context, screen, arguments: arguments);
}
