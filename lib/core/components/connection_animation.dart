import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class ConnectionAnimationOverlay {
  static late OverlayEntry _overlayEntry;

  static void show(BuildContext context, {required Widget child}) {
    final overlay = Overlay.of(context);

    _overlayEntry = OverlayEntry(
      builder:
          (context) => Stack(
            alignment: Alignment.center,
            children: [
              // Arka planı karartmak için yarı saydam bir Container
              Container(color: Colors.black.withValues(alpha: 0.5)),
              // Lottie animasyonu
              Lottie.asset(
                'assets/animations/connection_animation.json',
                width: 400,
                height: 400,
                fit: BoxFit.cover,
              ),
              // Mesaj veya ek widget
              child,
            ],
          ),
    );

    overlay.insert(_overlayEntry);
  }

  /// Overlay'i kaldır
  static void hide() {
    _overlayEntry.remove();
  }
}
