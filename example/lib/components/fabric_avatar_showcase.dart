import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';

class FabricAvatarShowcase extends StatelessWidget {
  const FabricAvatarShowcase({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text(
            'Sizes & Shapes (with Presence Status)',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
          const SizedBox(height: 12),
          const Wrap(
            spacing: 16,
            runSpacing: 12,
            crossAxisAlignment: WrapCrossAlignment.center,
            children: [
              FabricAvatar(
                name: 'XS',
                size: FabricAvatarSize.xs,
                status: FabricAvatarStatus.online,
              ),
              FabricAvatar(
                name: 'Sarah Connor',
                size: FabricAvatarSize.sm,
                status: FabricAvatarStatus.online,
              ),
              FabricAvatar(
                name: 'John Doe',
                size: FabricAvatarSize.md,
                status: FabricAvatarStatus.away,
              ),
              FabricAvatar(
                name: 'Alex Rivera',
                size: FabricAvatarSize.lg,
                status: FabricAvatarStatus.busy,
              ),
              FabricAvatar(
                name: 'Elena Rostova',
                size: FabricAvatarSize.xl,
                shape: FabricAvatarShape.rounded,
                status: FabricAvatarStatus.online,
              ),
            ],
          ),
          const SizedBox(height: 24),
          const Text(
            'Avatar Groups (Overlapping Stack)',
            style: TextStyle(fontWeight: FontWeight.w600, fontSize: 13),
          ),
          const SizedBox(height: 12),
          Wrap(
            spacing: 24,
            runSpacing: 16,
            children: [
              const FabricAvatarGroup(
                max: 3,
                avatars: [
                  FabricAvatar(name: 'Ana Silva'),
                  FabricAvatar(name: 'Bruno Lima'),
                  FabricAvatar(name: 'Carlos Santos'),
                  FabricAvatar(name: 'Diana Prince'),
                  FabricAvatar(name: 'Eduardo Ramos'),
                ],
              ),
              FabricAvatarGroup(
                max: 4,
                onOverflowTap: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(content: Text('Ver todos os membros')),
                  );
                },
                avatars: const [
                  FabricAvatar(
                    name: 'Tech Lead',
                    shape: FabricAvatarShape.rounded,
                  ),
                  FabricAvatar(
                    name: 'Frontend Dev',
                    shape: FabricAvatarShape.rounded,
                  ),
                  FabricAvatar(
                    name: 'UI Designer',
                    shape: FabricAvatarShape.rounded,
                  ),
                  FabricAvatar(
                    name: 'Product Manager',
                    shape: FabricAvatarShape.rounded,
                  ),
                  FabricAvatar(
                    name: 'QA Tester',
                    shape: FabricAvatarShape.rounded,
                  ),
                  FabricAvatar(
                    name: 'DevOps Eng',
                    shape: FabricAvatarShape.rounded,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
