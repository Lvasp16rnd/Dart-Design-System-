import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_gemini/DesignSystem/Components/Configurations/LanguageChange/language_change_view_model.dart';

class LanguageChange extends StatelessWidget {
  const LanguageChange({super.key});

  @override
  Widget build(BuildContext context) {
    // Agora apenas consome o ViewModel que foi provido no main.dart
    final viewModel = Provider.of<LanguageChangeViewModel>(context);

    return DropdownButton<Locale>(
      isExpanded: false, // Impede que o botão tente se expandir
      underline: const SizedBox.shrink(), // Remove a linha de baixo para um visual mais limpo
      value: viewModel.currentLocale,
      onChanged: (Locale? newLocale) {
        if (newLocale != null) {
          viewModel.changeLanguage(newLocale);
        }
      },
      items: viewModel.supportedLocales.map<DropdownMenuItem<Locale>>((Locale locale) {
        return DropdownMenuItem<Locale>(
          value: locale,
          child: Text(locale.languageCode.toUpperCase()),
        );
      }).toList(),
    );
  }
}
