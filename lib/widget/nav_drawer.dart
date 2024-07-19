import 'package:flatter/util/locale.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class NavDrawer extends StatelessWidget {
  const NavDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          ListTile(title: Text(context.l10n().appName.toUpperCase())),
          const Divider(),
          ListTile(
            title: Text(context.l10n().settingsTitle),
            leading: const Icon(Icons.settings),
            onTap: () => context.push('/settings'),
          ),
          ListTile(
            title: Text(context.l10n().actionLogout),
            leading: const Icon(Icons.account_circle),
            onTap: () => context.go('/'),
          ),
        ],
      ),
    );
  }
}
