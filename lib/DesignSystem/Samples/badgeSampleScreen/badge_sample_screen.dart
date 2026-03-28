import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:teste_gemini/DesignSystem/Components/Badge/badge_view_model.dart';

class BadgeSampleScreen extends StatelessWidget {
  const BadgeSampleScreen({super.key});

  @override
  Widget build(BuildContext context) {
    // Consome o ViewModel para obter a contagem e limpá-la.
    final badgeViewModel = Provider.of<BadgeViewModel>(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Notificações'),
      ),
      body: badgeViewModel.notificationCount > 0
          ? _buildNotificationsView(context, badgeViewModel)
          : _buildEmptyView(context),
    );
  }

  // Widget para quando há notificações
  Widget _buildNotificationsView(
      BuildContext context, BadgeViewModel badgeViewModel) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Você tem ${badgeViewModel.notificationCount} novas notificações.',
            style: Theme.of(context).textTheme.headlineSmall,
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 20),
          ElevatedButton(
            onPressed: () => badgeViewModel.clear(),
            child: const Text('Limpar Notificações'),
          ),
        ],
      ),
    );
  }

  // Widget para quando não há notificações
  Widget _buildEmptyView(BuildContext context) {
    return const Center(
      child: Text('Nenhuma notificação nova.', style: TextStyle(fontSize: 18, color: Colors.grey)),
    );
  }
}
