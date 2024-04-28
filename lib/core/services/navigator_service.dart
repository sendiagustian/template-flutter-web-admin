// import 'package:flutter/material.dart';

// class NavigatorService {
//   const NavigatorService();

//   static void pop<T extends Object?>(BuildContext context, [T? result]) {
//     return Navigator.pop(context, result);
//   }

//   static void popPushToPage(
//       {required BuildContext context, required Widget page}) {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       push(context: context, page: page);
//     });
//   }

//   static void popPushReplacementToPage({
//     required BuildContext context,
//     required Widget page,
//   }) {
//     WidgetsBinding.instance.addPostFrameCallback((_) {
//       push(context: context, page: page);
//     });
//   }

//   static void popToFirstIndex(BuildContext context) {
//     return Navigator.of(context).popUntil((route) => route.isFirst);
//   }

//   static Future<dynamic> push({
//     required BuildContext context,
//     required Widget page,
//   }) {
//     return Navigator.of(context).push(
//       PageRouteBuilder(
//         pageBuilder: (context, animation, secondaryAnimation) => page,
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           return child;
//         },
//       ),
//     );
//   }

//   static Future<dynamic> pushReplacement({
//     required BuildContext context,
//     required Widget page,
//   }) {
//     return Navigator.of(context).pushReplacement(
//       PageRouteBuilder(
//         pageBuilder: (context, animation, secondaryAnimation) => page,
//         transitionsBuilder: (context, animation, secondaryAnimation, child) {
//           return child;
//         },
//       ),
//     );
//   }

//   static Future<dynamic> pushAndRemoveUntil({
//     required BuildContext context,
//     required Widget page,
//   }) {
//     return Navigator.of(context, rootNavigator: true).pushAndRemoveUntil(
//         PageRouteBuilder(
//           pageBuilder: (context, animation, secondaryAnimation) => page,
//           transitionsBuilder: (context, animation, secondaryAnimation, child) {
//             return child;
//           },
//         ), (r) {
//       return false;
//     });
//   }

//   static Future<dynamic> pushNamed({
//     required BuildContext context,
//     required String route,
//   }) {
//     return Navigator.pushNamed(context, route);
//   }

//   static Future<dynamic> pushReplacementNamed({
//     required BuildContext context,
//     required String page,
//   }) {
//     return Navigator.pushReplacementNamed(
//       context,
//       page,
//     );
//   }
// }
