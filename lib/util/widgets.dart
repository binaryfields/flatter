import 'package:flutter/material.dart';

class ActivityIndicator extends StatelessWidget {
  const ActivityIndicator({
    Key key,
    @required this.child,
    this.busy = false,
  }) : super(key: key);

  final Widget child;
  final bool busy;

  @override
  Widget build(BuildContext context) {
    if (busy) {
      return Stack(
        children: [
          child,
          const Opacity(
            opacity: 0.3,
            child: const ModalBarrier(dismissible: false, color: Colors.grey),
          ),
          const Center(child: CircularProgressIndicator()),
        ],
      );
    } else {
      return child;
    }
  }
}

class Error extends StatelessWidget {
  const Error({this.message, this.onRetry});

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
            style: Theme.of(context).textTheme.subhead,
          ),
          const SizedBox(height: 8),
          RaisedButton(
            color: Theme.of(context).colorScheme.error,
            onPressed: onRetry,
            child: const Text('Retry', style: TextStyle(color: Colors.white)),
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
        'No content',
        style: Theme.of(context).textTheme.display1,
      ),
    );
  }
}
