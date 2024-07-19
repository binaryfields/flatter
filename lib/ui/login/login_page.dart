import 'package:flatter/util/error.dart';
import 'package:flatter/util/locale.dart';
import 'package:flatter/util/resource.dart';
import 'package:flatter/widget/common.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'login_bloc.dart';
import 'login_form.dart';
import 'login_state.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<LoginBloc>(
        create: (_) => LoginBloc(),
        child: Builder(
          builder: (context) {
            return Scaffold(
              backgroundColor: Colors.white,
              body: BlocConsumer<LoginBloc, LoginState>(
                listenWhen: (previous, current) =>
                    previous.loginOp != current.loginOp,
                listener: (context, state) {
                  if (state.loginOp == Resource.success) {
                    context.go('/posts');
                  } else if (state.loginOp == Resource.error) {
                    showError(context, context.l10n().errorGeneric);
                  }
                },
                builder: (context, state) {
                  return ActivityIndicator(
                    busy: state.isBusy,
                    child: SingleChildScrollView(
                      child: Padding(
                        padding: const EdgeInsets.all(16),
                        child: LoginForm(),
                      ),
                    ),
                  );
                },
              ),
            );
          },
        ));
  }
}
