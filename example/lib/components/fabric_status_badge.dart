import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';

class FabricStatusBadgeShowcase extends StatelessWidget {
  const FabricStatusBadgeShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Semantic Variants (Subtle with Dot)',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
          const SizedBox(height: 10),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              FabricBadge(
                label: 'Neutral',
                variant: FabricBadgeVariant.neutral,
                showDot: true,
              ),
              FabricBadge(
                label: 'In Progress',
                variant: FabricBadgeVariant.info,
                showDot: true,
              ),
              FabricBadge(
                label: 'Completed',
                variant: FabricBadgeVariant.success,
                showDot: true,
              ),
              FabricBadge(
                label: 'Warning',
                variant: FabricBadgeVariant.warning,
                showDot: true,
              ),
              FabricBadge(
                label: 'Failed',
                variant: FabricBadgeVariant.error,
                showDot: true,
              ),
              FabricBadge(
                label: 'Primary',
                variant: FabricBadgeVariant.primary,
                showDot: true,
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Styles (Solid & Outline)',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
          const SizedBox(height: 10),
          const Wrap(
            spacing: 8,
            runSpacing: 8,
            children: [
              FabricBadge(
                label: 'Active',
                variant: FabricBadgeVariant.success,
                style: FabricBadgeStyle.solid,
              ),
              FabricBadge(
                label: 'Review',
                variant: FabricBadgeVariant.warning,
                style: FabricBadgeStyle.solid,
              ),
              FabricBadge(
                label: 'Critical',
                variant: FabricBadgeVariant.error,
                style: FabricBadgeStyle.solid,
              ),
              FabricBadge(
                label: 'Standard',
                variant: FabricBadgeVariant.neutral,
                style: FabricBadgeStyle.outline,
              ),
              FabricBadge(
                label: 'Verified',
                variant: FabricBadgeVariant.info,
                style: FabricBadgeStyle.outline,
                leading: Icon(Icons.verified_rounded),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            'Sizes & Interactive (with Dismiss)',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
          const SizedBox(height: 10),
          Wrap(
            spacing: 8,
            runSpacing: 8,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              const FabricBadge(
                label: 'Small',
                size: FabricBadgeSize.sm,
                variant: FabricBadgeVariant.neutral,
              ),
              const FabricBadge(
                label: 'Medium',
                size: FabricBadgeSize.md,
                variant: FabricBadgeVariant.info,
              ),
              const FabricBadge(
                label: 'Large',
                size: FabricBadgeSize.lg,
                variant: FabricBadgeVariant.primary,
              ),
              FabricBadge(
                label: 'Removable Tag',
                variant: FabricBadgeVariant.neutral,
                onDeleted: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Tag removida!')),
                  );
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
