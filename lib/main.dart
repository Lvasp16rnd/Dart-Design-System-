import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_gemini/DesignSystem/Components/Badge/badge.dart';
import 'package:teste_gemini/DesignSystem/Components/Configurations/LanguageChange/language_change_view_model.dart';
import 'package:teste_gemini/DesignSystem/Components/Configurations/LetterChange/letter_change_view_model.dart';
import 'package:teste_gemini/DesignSystem/Components/Configurations/ThemeChange/theme_change_view_model.dart';
import 'package:teste_gemini/DesignSystem/Components/Badge/badge_view_model.dart';
import '../DesignSystem/Samples/actionButtonSampleScreen/action_button_sample_screen.dart';
import '../DesignSystem/Samples/bottomTabBarSampleScreen/bottom_tab_bar_sample_screen.dart';
import '../DesignSystem/Samples/configSampleScreen/config_sample_screen.dart';
import '../DesignSystem/Samples/inputFieldSampleScreen/input_field_sample_screen.dart';
import '../DesignSystem/Samples/linkedLabelSampleScreen/linked_label_sample_screen.dart';
import '../DesignSystem/Samples/tabComponentSampleScreen/tab_sample_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:teste_gemini/l10n/app_localizations_manual.dart';

void main() {
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => LanguageChangeViewModel()),
      ChangeNotifierProvider(create: (context) => LetterChangeViewModel()),
      ChangeNotifierProvider(create: (context) => ThemeChangeViewModel()),
      ChangeNotifierProvider(create: (context) => BadgeViewModel()),
    ],
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    // Ouve as mudanças nos ViewModels
    return Consumer4<LanguageChangeViewModel, LetterChangeViewModel,
        ThemeChangeViewModel, BadgeViewModel>(
      builder: (context, languageViewModel, letterViewModel, themeViewModel, 
          badgeViewModel, child) {
        return MaterialApp(
          title: 'Flutter Demo',
          // Define o modo do tema (claro, escuro ou sistema)
          themeMode: themeViewModel.currentTheme,
          // Tema claro padrão
          theme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple, brightness: Brightness.light),
            useMaterial3: true,
            // Aplica as configurações de texto do ViewModel ao tema do app
            textTheme: Theme.of(context).textTheme.apply(
                  fontSizeFactor: letterViewModel.fontSize / 14.0, // Usa 14 como tamanho base
                  bodyColor: letterViewModel.selectedColor,
                  displayColor: letterViewModel.selectedColor,
                  // A mudança de fontFamily requer configuração adicional no pubspec.yaml
                  // fontFamily: letterViewModel.fontFamily,
                  // Aplica a família da fonte selecionada
                  fontFamily: letterViewModel.fontFamily,
                ),
          ),
          // Tema escuro
          darkTheme: ThemeData(
            colorScheme: ColorScheme.fromSeed(
                seedColor: Colors.deepPurple, brightness: Brightness.dark),
            useMaterial3: true,
            // Aplica as mesmas configurações de texto ao tema escuro
            textTheme: Theme.of(context).textTheme.apply(
                  fontSizeFactor: letterViewModel.fontSize / 14.0,
                  // No tema escuro, é melhor deixar o Flutter gerenciar as cores do texto
                  // para garantir a legibilidade. Podemos reavaliar isso se necessário.
                  // bodyColor: letterViewModel.selectedColor,
                  // displayColor: letterViewModel.selectedColor,
                  fontFamily: letterViewModel.fontFamily,
                ),
          ),
          // Define o locale atual do app
          locale: languageViewModel.currentLocale,
          // Informa ao Flutter quais locales são suportados
          supportedLocales: languageViewModel.supportedLocales,
          // Configuração necessária para internacionalização.
          localizationsDelegates: const [
            AppLocalizationsManualDelegate(), // Nosso delegate manual
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          home: const ButtonScreen(),
        );
      },
    );
  }
}

class ButtonScreen extends StatelessWidget {
  const ButtonScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Design System Sample App'),
        actions: const [
          // Adiciona o botão de notificação na AppBar
          BadgeButton(),
        ],
      ),
      body: Center(
        child: SizedBox(
          height: MediaQuery.of(context).size.height * 0.8,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              // Botão para simular o recebimento de uma notificação
              ElevatedButton(
                onPressed: () => context.read<BadgeViewModel>().increment(),
                child: const Text('Simular Nova Notificação'),
              ),
              _buildButton(context, 'Action Button', ActionButtonPage()),
              _buildButton(context, 'Bottom Tab Bar', BottomTabBarPage()),
              _buildButton(context, 'Input Text Field', InputFieldPage()),
              _buildButton(context, 'Linked Label', LinkedLabelPage()),
              _buildButton(context, 'Tab Bar', TabPage()),
              _buildButton(context, 'Configurations', const ConfigSampleScreen()),
            ],
          ),
        ),
      ),
    );
  }

  ElevatedButton _buildButton(BuildContext context, String text, Widget scene) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => scene),
        );
      },
      child: Text(text),
    );
  }
}

// Scene Widgets
class Scene1 extends StatelessWidget {
  const Scene1({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scene 1')),
      body: const Center(child: Text('Welcome to Scene 1')),
    );
  }
}

class Scene2 extends StatelessWidget {
  const Scene2({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scene 2')),
      body: const Center(child: Text('Welcome to Scene 2')),
    );
  }
}

class Scene3 extends StatelessWidget {
  const Scene3({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scene 3')),
      body: const Center(child: Text('Welcome to Scene 3')),
    );
  }
}

class Scene4 extends StatelessWidget {
  const Scene4({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scene 4')),
      body: const Center(child: Text('Welcome to Scene 4')),
    );
  }
}

class Scene5 extends StatelessWidget {
  const Scene5({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Scene 5')),
      body: const Center(child: Text('Welcome to Scene 5')),
    );
  }
}