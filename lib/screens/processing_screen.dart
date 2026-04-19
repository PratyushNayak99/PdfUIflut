import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:flutter_animate/flutter_animate.dart';
import '../components/phone_frame.dart';

class ProcessingScreen extends StatefulWidget {
  const ProcessingScreen({super.key});

  @override
  State<ProcessingScreen> createState() => _ProcessingScreenState();
}

class _ProcessingScreenState extends State<ProcessingScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 800),
      vsync: this,
    );
    _controller.repeat(reverse: true);

    // Navigate to player after animation
    Future.delayed(const Duration(milliseconds: 2500), () {
      if (mounted) {
        context.pushReplacement('/player');
      }
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return PhoneFrame(
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Animated waveform bars
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(5, (index) {
                return Container(
                  width: 8,
                  height: 20,
                  margin: const EdgeInsets.symmetric(horizontal: 4),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(4),
                  ),
                ).animate(
                  onPlay: (controller) => controller.repeat(reverse: true),
                ).scaleY(
                  duration: const Duration(milliseconds: 800),
                  begin: const Offset(1.0, 1.0),
                  end: const Offset(1.0, 2.5),
                  curve: Curves.easeInOut,
                ).delay(Duration(milliseconds: (index * 100)));
              }),
            ),
            const SizedBox(height: 32),
            // Text
            Text(
              'Converting your PDF to audio…',
              style: theme.textTheme.titleMedium?.copyWith(
                fontWeight: FontWeight.w500,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 8),
            Text(
              'This may take a moment',
              style: theme.textTheme.bodySmall,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 32),
            // Progress bar with shimmer
            Container(
              width: 256,
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 256,
                    height: 4,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.primary,
                    ),
                  ).animate(
                    onPlay: (controller) => controller.repeat(),
                  ).shimmer(
                    duration: const Duration(milliseconds: 2500),
                    color: theme.colorScheme.primary.withOpacity(0.5),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
