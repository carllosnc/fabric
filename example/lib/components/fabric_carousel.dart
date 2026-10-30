import 'package:fabric/fabric.dart';
import 'package:flutter/material.dart';

class _CarouselSlide {
  const _CarouselSlide({
    required this.title,
    required this.subtitle,
    required this.imageUrl,
  });

  final String title;
  final String subtitle;
  final String imageUrl;
}

class FabricCarousel extends StatelessWidget {
  const FabricCarousel({super.key});

  static const List<_CarouselSlide> _slides = <_CarouselSlide>[
    _CarouselSlide(
      title: 'Minimal Architecture',
      subtitle: 'Concrete & natural light',
      imageUrl:
          'https://images.unsplash.com/photo-1600585154340-be6161a56a0c?auto=format&fit=crop&w=800&q=80',
    ),
    _CarouselSlide(
      title: 'Nordic Interior',
      subtitle: 'Warm neutral textures',
      imageUrl:
          'https://images.unsplash.com/photo-1618221195710-dd6b41faaea6?auto=format&fit=crop&w=800&q=80',
    ),
    _CarouselSlide(
      title: 'Geometric Facade',
      subtitle: 'Modernist structural lines',
      imageUrl:
          'https://images.unsplash.com/photo-1513694203232-719a280e022f?auto=format&fit=crop&w=800&q=80',
    ),
    _CarouselSlide(
      title: 'Alpine Serenity',
      subtitle: 'Misty mountain peaks',
      imageUrl:
          'https://images.unsplash.com/photo-1506744038136-46273834b3fb?auto=format&fit=crop&w=800&q=80',
    ),
    _CarouselSlide(
      title: 'Coastal Horizon',
      subtitle: 'Oceanic calm & cliffs',
      imageUrl:
          'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?auto=format&fit=crop&w=800&q=80',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    final FabricThemeExtension tokens = context.fabricTokens;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      child: SizedBox(
        height: 190,
        child: CarouselView(
          itemExtent: 260,
          shrinkExtent: 180,
          itemSnapping: true,
          children: _slides.map((_CarouselSlide slide) {
            return Stack(
              fit: StackFit.expand,
              children: <Widget>[
                Image.network(
                  slide.imageUrl,
                  fit: BoxFit.cover,
                  loadingBuilder: (
                    BuildContext context,
                    Widget child,
                    ImageChunkEvent? loadingProgress,
                  ) {
                    if (loadingProgress == null) {
                      return child;
                    }
                    return Container(
                      color: tokens.surfaceElevated,
                      alignment: Alignment.center,
                      child: const SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                    );
                  },
                  errorBuilder: (
                    BuildContext context,
                    Object error,
                    StackTrace? stackTrace,
                  ) {
                    return Container(
                      color: tokens.surfaceElevated,
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.image_outlined,
                        color: tokens.mutedForeground,
                        size: 32,
                      ),
                    );
                  },
                ),
                DecoratedBox(
                  decoration: BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                      colors: <Color>[
                        Colors.transparent,
                        Colors.black.withValues(alpha: 0.15),
                        Colors.black.withValues(alpha: 0.78),
                      ],
                      stops: const <double>[0.35, 0.65, 1.0],
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(14),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: <Widget>[
                      Text(
                        slide.title,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.titleSmall?.copyWith(
                              color: Colors.white,
                            ),
                      ),
                      const SizedBox(height: 2),
                      Text(
                        slide.subtitle,
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                              color: Colors.white.withValues(alpha: 0.8),
                            ),
                      ),
                    ],
                  ),
                ),
              ],
            );
          }).toList(),
        ),
      ),
    );
  }
}
