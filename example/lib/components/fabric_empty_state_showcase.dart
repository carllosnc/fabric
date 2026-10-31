import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';

class FabricEmptyStateShowcase extends StatelessWidget {
  const FabricEmptyStateShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 0,
            child: FabricEmptyState(
              title: 'Nenhum item encontrado',
              description: 'Tente ajustar os filtros ou buscar por outro termo para encontrar o que procura.',
              iconData: Icons.search_off_rounded,
              action: ElevatedButton(
                onPressed: () {},
                child: const Text('Limpar Filtros'),
              ),
              secondaryAction: OutlinedButton(
                onPressed: () {},
                child: const Text('Saiba mais'),
              ),
            ),
          ),
          const SizedBox(height: 16),
          Card(
            elevation: 0,
            child: FabricEmptyState(
              compact: true,
              title: 'Sem notificações pendentes',
              description: 'Você visualizou todas as suas mensagens recentes.',
              iconData: Icons.notifications_none_rounded,
              action: TextButton(
                onPressed: () {},
                child: const Text('Atualizar'),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
