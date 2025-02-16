// list_home.dart
import 'package:flutter/material.dart';
import 'package:luma/core/themes/app_theme.dart';

class ListHome extends StatelessWidget {
  const ListHome({super.key});

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).extension<AppColorTheme>()!;

    return Row(
      children: [
        NavigationRail(
          selectedIndex: 0,
          backgroundColor: colors.surfaceVariant,
          destinations: const [
            NavigationRailDestination(
              icon: Icon(Icons.all_inclusive),
              label: Text('All'),
            ),
            NavigationRailDestination(
              icon: Icon(Icons.work),
              label: Text('Work'),
            ),
            // Add other destinations
          ],
        ),
        Expanded(
          child: ListView.builder(
            padding: const EdgeInsets.all(16),
            itemCount: 10,
            itemBuilder: (context, index) => Card(
              color: colors.surface,
              child: ListTile(
                title: Text(
                  'Note ${index + 1}',
                  style: TextStyle(color: colors.textPrimary),
                ),
                subtitle: Text(
                  'Content description...',
                  style: TextStyle(color: colors.textSecondary),
                ),
                trailing: Chip(
                  label: const Text('#Personal'),
                  backgroundColor: colors.surfaceVariant,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
