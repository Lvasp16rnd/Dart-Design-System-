import 'package:flutter/material.dart';
import 'package:teste_gemini/DesignSystem/Components/Configurations/LetterChange/letter_change.dart';

class LetterChangeScreen extends StatelessWidget {
  const LetterChangeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações de Fonte'),
      ),
      body: const Padding(
        padding: EdgeInsets.all(16.0),
        // Reutilizamos o componente que você já criou!
        child: LetterChange(),
      ),
    );
  }
}