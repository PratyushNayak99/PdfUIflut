import 'package:flutter/material.dart';

/// PhoneFrame wrapper for the app.
/// Unlike the React web demo, this runs natively fullscreen on Android.
/// Uses SafeArea to avoid system bars and notches.
class PhoneFrame extends StatelessWidget {
  final Widget child;

  const PhoneFrame({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: double.infinity,
      color: Theme.of(context).scaffoldBackgroundColor,
      child: SafeArea(
        child: child,
      ),
    );
  }
}
