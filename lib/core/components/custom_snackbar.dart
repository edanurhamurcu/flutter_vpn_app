import 'package:flutter/material.dart';

class CustomSnackbar {
  static void showInfo(BuildContext context, String message) {
    _showSnackbar(context, message, Colors.blue, Icons.info_outline);
  }

  static void showSuccess(BuildContext context, String message) {
    _showSnackbar(context, message, Colors.green, Icons.check_circle_outline);
  }

  static void showError(BuildContext context, String message) {
    _showSnackbar(context, message, Colors.red, Icons.error_outline);
  }

  static void _showSnackbar(
    BuildContext context,
    String message,
    Color iconColor,
    IconData icon,
  ) {
    final overlay = Overlay.of(context);
    final theme = Theme.of(context);
    final overlayEntry = OverlayEntry(
      builder:
          (context) => Positioned(
            top: MediaQuery.of(context).padding.top + 4,
            left: 4,
            right: 4,
            child: Material(
              color: Colors.transparent,
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: theme.snackBarTheme.backgroundColor,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Row(
                  children: [
                    Icon(icon, color: iconColor),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        message,
                        style: theme.textTheme.bodyMedium?.copyWith(
                          color: theme.snackBarTheme.contentTextStyle?.color,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
    );

    overlay.insert(overlayEntry);

    Future.delayed(const Duration(seconds: 3), () {
      overlayEntry.remove();
    });
  }
}
