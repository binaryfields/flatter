import 'package:flatter/util/error.dart';
import 'package:flatter/util/locale.dart';
import 'package:flatter/util/resource.dart';
import 'package:flatter/widget/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'settings_bloc.dart';
import 'settings_form.dart';
import 'settings_state.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

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
                  final _ = switch (state.submitOp) {
                    Success _ => context.pop(),
                    Failure _ =>
                      showError(context, context.l10n().errorGeneric),
                    _ => (),
                  };
                },
                buildWhen: (previous, current) =>
                    previous.isBusy != current.isBusy,
                builder: (context, state) {
                  return ActivityIndicator(
                    busy: state.isBusy,
                    child: SingleChildScrollView(
                      child: SettingsForm(),
                    ),
                  );
                },
              ),
            );
          },
        ));
  }
}
