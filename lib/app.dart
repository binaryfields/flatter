import 'package:flatter/ui/posts/posts_page.dart';
import 'package:flatter/util/scroll_behavior.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

import 'config/theme.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flatter',
      theme: theme,
      home: const PostsPage(),
      debugShowCheckedModeBanner: false,
      scrollBehavior: kIsWeb ? WebScrollBehavior() : null,
      localizationsDelegates: AppLocalizations.localizationsDelegates,
      supportedLocales: AppLocalizations.supportedLocales,
    );
  }
}
