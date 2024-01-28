import 'dart:async';
import 'package:flutter/material.dart';

void showMaterialBanner(BuildContext context, String message, VoidCallback onActionPressed, String actionLabel) {
  ScaffoldMessenger.of(context).showMaterialBanner(
    MaterialBanner(
      content: Text(message),
      actions: [
        TextButton(
          onPressed: onActionPressed,
          child:  Text(actionLabel),
        ),
      ],
      dividerColor: Colors.transparent,
      elevation: 5,
      backgroundColor: Colors.white.withOpacity(0.9),
      surfaceTintColor: Colors.white,
      margin: const EdgeInsets.all(20),
    ),
  );

  Timer(const Duration(seconds: 3), () {
    ScaffoldMessenger.of(context).clearMaterialBanners();
  });
}




