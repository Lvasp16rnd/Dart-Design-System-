import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_gemini/DesignSystem/Components/Badge/badge_view_model.dart';
import 'package:teste_gemini/DesignSystem/Samples/badgeSampleScreen/badge_sample_screen.dart';

class BadgeButton extends StatelessWidget {
  const BadgeButton({super.key});

  @override
  Widget build(BuildContext context) {
    // Ouve as mudanças no BadgeViewModel
    return Consumer<BadgeViewModel>(
      builder: (context, viewModel, child) {
        return Stack(
          alignment: Alignment.center,
          children: [
            IconButton(
              icon: const Icon(Icons.notifications),
              onPressed: () {
                // Apenas navega para a tela. A contagem é gerenciada pelo ViewModel.
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const BadgeSampleScreen()),
                );
              },
            ),
            if (viewModel.notificationCount > 0)
              Positioned(
                right: 8,
                top: 8,
                child: Container(
                  padding: const EdgeInsets.all(2),
                  decoration: BoxDecoration(
                    color: Colors.red,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  constraints: const BoxConstraints(minWidth: 16, minHeight: 16),
                  child: Text(
                    '${viewModel.notificationCount}',
                    style: const TextStyle(color: Colors.white, fontSize: 10),
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
          ],
        );
      },
    );
  }
}
