import 'app_localizations.dart';

/// The translations for English (`en`).
class AppLocalizationsEn extends AppLocalizations {
  AppLocalizationsEn([String locale = 'en']) : super(locale);

  @override
  String get homeAppBar => 'Welcome!';

  @override
  String get detailAppBar => 'Status Details';

  @override
  String get createAppBar => 'Create Status';

  @override
  String get settingsAppBar => 'Settings';

  @override
  String get buttonLogin => 'Log In';

  @override
  String get buttonRegister => 'Register';

  @override
  String get buttonPost => 'Post Status Now!';

  @override
  String get description => 'Description';

  @override
  String get takeApicture => 'Click, Take a picture';

  @override
  String get openSettings => 'Change language?';

  @override
  String get open => 'Open';

  @override
  String get logout => 'Logout';
}
