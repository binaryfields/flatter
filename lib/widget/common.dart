import 'package:flatter/util/locale.dart';
import 'package:flutter/material.dart';

class ActivityIndicator extends StatelessWidget {
  const ActivityIndicator({super.key, required this.busy, required this.child});

  final bool busy;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    if (busy) {
      return Stack(
        children: [
          child,
          const Opacity(
            opacity: 0.3,
            child: ModalBarrier(dismissible: false, color: Colors.grey),
          ),
          const Center(child: CircularProgressIndicator()),
        ],
      );
    } else {
      return child;
    }
  }
}

class ErrorPrompt extends StatelessWidget {
  final String message;
  final VoidCallback onRetry;

  const ErrorPrompt({super.key, required this.message, required this.onRetry});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            message,
            style: Theme.of(context).textTheme.titleMedium,
          ),
          const SizedBox(height: 8),
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              foregroundColor: Theme.of(context).colorScheme.error,
            ),
            onPressed: onRetry,
            child: Text(
              context.l10n().actionRetry,
              style: const TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class NoContent extends StatelessWidget {
  const NoContent({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.l10n().widgetNoContent,
        style: Theme.of(context).textTheme.headlineMedium,
      ),
    );
  }
}
