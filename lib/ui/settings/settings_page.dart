import 'package:flatter/util/error.dart';
import 'package:flatter/util/locale.dart';
import 'package:flatter/util/resource.dart';
import 'package:flatter/widget/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'settings_bloc.dart';
import 'settings_form.dart';

class SettingsPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider<SettingsBloc>(
        create: (_) => SettingsBloc()..init(),
        child: Builder(
          builder: (context) {
            return Scaffold(
              appBar: AppBar(
                title: Text(context.l10n().settingsTitle),
                centerTitle: true,
                actions: [
                  IconButton(
                    icon: const Icon(Icons.save),
                    tooltip: context.l10n().actionSave,
                    onPressed: () => context.read<SettingsBloc>().submit(),
                  ),
                ],
              ),
              body: BlocConsumer<SettingsBloc, SettingsState>(
                listenWhen: (previous, current) =>
                    previous.submitOp != current.submitOp,
                listener: (context, state) {
                  if (state.submitOp == Resource.success) {
                    Navigator.of(context).pop();
                  } else if (state.submitOp == Resource.error) {
                    showError(context, context.l10n().errorGeneric);
                  }
                },
                buildWhen: (previous, current) =>
                    previous.status != current.status ||
                    previous.isBusy != current.isBusy,
                builder: (context, state) {
                  switch (state.status) {
                    case Resource.initial:
                    case Resource.loading:
                      return const Center(child: CircularProgressIndicator());
                    case Resource.error:
                      return ErrorPrompt(
                        message: context.l10n().errorGeneric,
                        onRetry: () => context.read<SettingsBloc>().init(),
                      );
                    default:
                      return ActivityIndicator(
                        busy: state.isBusy,
                        child: SingleChildScrollView(
                          child: SettingsForm(),
                        ),
                      );
                  }
                },
              ),
            );
          },
        ));
  }
}
