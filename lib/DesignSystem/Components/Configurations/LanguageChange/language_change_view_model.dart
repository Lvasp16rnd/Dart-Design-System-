import 'package:flutter/material.dart';

class LanguageChangeViewModel extends ChangeNotifier {
  // Lista de idiomas suportados pela aplicação.
  final List<Locale> _supportedLocales = [
    const Locale('en', 'US'),
    const Locale('pt', 'BR'),
    const Locale('es', 'ES'),
  ];

  // Define o local (idioma) inicial como o primeiro da lista suportada.
  late Locale _currentLocale = _supportedLocales.first;

  // Getter para acessar o local atual.
  Locale get currentLocale => _currentLocale;

  // Getter para a lista de locais suportados.
  List<Locale> get supportedLocales => _supportedLocales;

  /// Altera o idioma da aplicação.
  void changeLanguage(Locale newLocale) {
    _currentLocale = newLocale;
    // Aqui você integraria com seu pacote de localização para de fato
    // alterar o idioma do aplicativo.
    notifyListeners(); // Notifica os widgets que estão ouvindo sobre a mudança.
  }
}
