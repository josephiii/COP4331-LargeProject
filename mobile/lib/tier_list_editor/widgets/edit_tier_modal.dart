import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile/tier_list_editor/bloc/tier_list_editor_bloc.dart';
import 'package:tier_lists_repository/tier_lists_repository.dart' show Tier;
import 'rename_tier_dialog.dart';
import 'color_picker_dialog.dart';

class EditTierModal extends StatelessWidget {
  final String _tierId;

  const EditTierModal(String tierId, {super.key}) : _tierId = tierId;

  @override
  Widget build(BuildContext context) {
    final tier = context
        .read<TierListEditorBloc>()
        .state
        .tierList!
        .tiers
        .firstWhere((tier) => tier.id == _tierId);

    return Container(
      height: 250,
      color: Colors.grey[850],
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(vertical: 16),
            alignment: Alignment.center,
            color: tier.color,
            child: Text(
              tier.name,
              style: const TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
          ),
          ListTile(
            leading: const Icon(Icons.edit),
            title: const Text('Rename Tier'),
            onTap: () {
              Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (_) => BlocProvider.value(
                  value: context.read<TierListEditorBloc>(),
                  child: RenameTierDialog(tier),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.palette),
            title: const Text('Change Tier Color'),
            onTap: () {
              Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (_) => BlocProvider.value(
                  value: context.read<TierListEditorBloc>(),
                  child: ColorPickerDialog(tier),
                ),
              );
            },
          ),
          ListTile(
            leading: const Icon(Icons.delete),
            title: const Text('Delete Tier'),
            onTap: () {
              Navigator.of(context).pop();
              showDialog(
                context: context,
                builder: (_) => BlocProvider.value(
                  value: context.read<TierListEditorBloc>(),
                  child: DeleteTierDialog(tier),
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}

class DeleteTierDialog extends StatelessWidget {
  final Tier tier;

  const DeleteTierDialog(this.tier, {super.key});

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Are you sure you want to delete ${tier.name}?'),
      content: const Text('All tier items will be moved to staging.'),
      actions: [
        TextButton(
          onPressed: () => Navigator.of(context).pop(),
          child: const Text('Cancel'),
        ),
        TextButton(
          onPressed: () {
            context.read<TierListEditorBloc>().add(
              TierListEditorTierDeleted(tier),
            );
            Navigator.pop(context);
          },
          child: const Text('Delete'),
        ),
      ],
    );
  }
}
