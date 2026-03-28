import 'package:flutter/material.dart';

class AppLocalizationsManual {
  final Locale locale;

  AppLocalizationsManual(this.locale);

  static AppLocalizationsManual of(BuildContext context) {
    return Localizations.of<AppLocalizationsManual>(context, AppLocalizationsManual)!;
  }

  static const _localizedValues = <String, Map<String, String>>{
    'en': {
      'configChangeLanguage': 'Change Language',
      'configChangeFont': 'Change Font',
      'configChangeTheme': 'Change Theme',
      'configurations': 'Configurations',
    },
    'pt': {
      'configChangeLanguage': 'Mudar Idioma',
      'configChangeFont': 'Mudar Fonte',
      'configChangeTheme': 'Mudar Tema',
      'configurations': 'Configurações',
    },
    'es': {
      'configChangeLanguage': 'Cambiar Idioma',
      'configChangeFont': 'Cambiar Fuente',
      'configChangeTheme': 'Cambiar Tema',
      'configurations': 'Configuraciones',
    },
  };

  // Função auxiliar para buscar traduções com segurança
  String _translate(String key) {
    return _localizedValues[locale.languageCode]?[key] ?? _localizedValues['en']![key]!;
  }

  String get configChangeLanguage => _translate('configChangeLanguage');
  String get configChangeFont => _translate('configChangeFont');
  String get configChangeTheme => _translate('configChangeTheme');
  String get configurations => _translate('configurations');
}

class AppLocalizationsManualDelegate extends LocalizationsDelegate<AppLocalizationsManual> {
  const AppLocalizationsManualDelegate();

  @override
  bool isSupported(Locale locale) => ['en', 'pt', 'es'].contains(locale.languageCode);

  @override
  Future<AppLocalizationsManual> load(Locale locale) async => AppLocalizationsManual(locale);

  @override
  bool shouldReload(AppLocalizationsManualDelegate old) => false;
}
