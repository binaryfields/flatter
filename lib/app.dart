import 'package:flatter/service/service_module.dart';
import 'package:flatter/ui/posts/posts_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'config/theme.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ServiceModule(
      child: MaterialApp(
        title: 'Flatter',
        theme: theme,
        home: PostsPage(),
        localizationsDelegates: AppLocalizations.localizationsDelegates,
        supportedLocales: AppLocalizations.supportedLocales,
      ),
    );
  }
}
