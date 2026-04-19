import 'package:flutter/material.dart';
import 'package:dipe_freelance/core/localization/l10n/app_localizations.dart';

extension ContextExtensions on BuildContext {
  ThemeData get theme => Theme.of(this);
  TextTheme get textTheme => Theme.of(this).textTheme;
  ColorScheme get colorScheme => Theme.of(this).colorScheme;
  AppLocalizations get local => AppLocalizations.of(this)!;
}
