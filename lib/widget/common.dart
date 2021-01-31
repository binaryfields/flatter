import 'package:flatter/util/locale.dart';
import 'package:flutter/material.dart';

class ActivityIndicator extends StatelessWidget {
  const ActivityIndicator({Key? key, required this.busy, required this.child})
      : super(key: key);

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
  const ErrorPrompt({required this.message, required this.onRetry});

  final String message;
  final VoidCallback onRetry;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Text(
            message,
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(height: 8),
          RaisedButton(
            color: Theme.of(context).colorScheme.error,
            onPressed: onRetry,
            child: Text(
              context.l10n().actionRetry,
              style: TextStyle(color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }
}

class NoContent extends StatelessWidget {
  const NoContent();

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text(
        context.l10n().widgetNoContent,
        style: Theme.of(context).textTheme.headline4,
      ),
    );
  }
}
