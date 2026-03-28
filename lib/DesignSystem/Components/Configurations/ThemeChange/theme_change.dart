import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_gemini/DesignSystem/Components/Configurations/ThemeChange/theme_change_view_model.dart';

class ThemeChangeButton extends StatelessWidget {
  const ThemeChangeButton({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeChangeViewModel>(
      builder: (context, viewModel, child) {
        // Usamos um SizedBox para limitar a largura do Switch
        // quando ele está sendo usado como um widget 'trailing'.
        return SizedBox(
          width: 60,
          child: Switch(
            value: viewModel.isDarkMode,
            onChanged: (value) {
              viewModel.toggleTheme();
            },
          ),
        );
      },
    );
  }
}
