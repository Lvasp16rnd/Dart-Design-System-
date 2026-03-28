import 'package:flutter/material.dart';
import 'package:teste_gemini/DesignSystem/Components/Configurations/configurations.dart';
import 'package:teste_gemini/l10n/app_localizations_manual.dart';

class ConfigSampleScreen extends StatefulWidget {
  const ConfigSampleScreen({super.key});

  @override
  State<ConfigSampleScreen> createState() => _ConfigSampleScreenState();
}

class _ConfigSampleScreenState extends State<ConfigSampleScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizationsManual.of(context).configurations),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 8.0),
        children: Configurations.getConfigOptions(context)
            .map((option) => ListTile(
                  leading: Icon(option.icon),
                  title: Text(option.title),
                  // Chama a função onTap com o contexto quando ela existe
                  onTap: option.onTap != null ? () => option.onTap!(context) : null,
                  trailing: option.trailing,
                ))
            .toList(),
      ),
    );
  }
}
