import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

extension AppLocalizationsX on BuildContext {
  AppLocalizations l10n() {
    return AppLocalizations.of(this)!;
  }
}
