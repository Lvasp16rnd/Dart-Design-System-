import 'package:flutter/material.dart';
import 'package:teste_gemini/DesignSystem/Components/Configurations/LanguageChange/language_change.dart';
import 'package:teste_gemini/DesignSystem/Samples/configSampleScreen/letter_change_screen.dart';
import 'package:teste_gemini/DesignSystem/Components/Configurations/ThemeChange/theme_change.dart';
import 'package:teste_gemini/l10n/app_localizations_manual.dart';

class ConfigOption {
  final String title;
  final IconData icon;
  // Modificado para aceitar um BuildContext para navegação
  final Function(BuildContext context)? onTap;
  final Widget? trailing;

  ConfigOption({
    required this.title,
    required this.icon,
    this.onTap,
    this.trailing,
  });
}

class Configurations {
  static List<ConfigOption> getConfigOptions(BuildContext context) {
    final l10n = AppLocalizationsManual.of(context);
    return [
      ConfigOption(
        title: l10n.configChangeLanguage,
        icon: Icons.language,
        trailing: const LanguageChange(),
      ),
      ConfigOption(
        title: l10n.configChangeFont,
        icon: Icons.font_download,
        // Agora, o onTap navega para a nova tela de exemplo
        onTap: (context) => Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => const LetterChangeScreen()),
        ),
      ),
      ConfigOption(
        title: l10n.configChangeTheme,
        icon: Icons.brightness_6,
        trailing: const ThemeChangeButton(),
      ),
    ];
  }
}