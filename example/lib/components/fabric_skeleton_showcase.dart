import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';

class FabricSkeletonShowcase extends StatelessWidget {
  const FabricSkeletonShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Profile Card Skeleton',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        ),
        const SizedBox(height: 12),
        Card(
          elevation: 0,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const FabricSkeleton.circular(size: 48),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const FabricSkeleton(width: 140, height: 16),
                      const SizedBox(height: 10),
                      FabricSkeleton.text(
                        lines: 2,
                        width: double.infinity,
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 20),
        const Text(
          'Media Container Skeleton',
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
        ),
        const SizedBox(height: 12),
        const FabricSkeleton.card(
          height: 110,
          borderRadius: BorderRadius.all(Radius.circular(12)),
        ),
      ],
    );
  }
}
