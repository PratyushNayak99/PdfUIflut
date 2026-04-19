import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
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
              children: [
                _AnimatedBar(controller: _controller, delay: 0.0),
                _AnimatedBar(controller: _controller, delay: 0.1),
                _AnimatedBar(controller: _controller, delay: 0.2),
                _AnimatedBar(controller: _controller, delay: 0.3),
                _AnimatedBar(controller: _controller, delay: 0.4),
              ],
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
            // Progress bar
            Container(
              width: 256,
              height: 4,
              decoration: BoxDecoration(
                color: theme.colorScheme.surfaceVariant,
                borderRadius: BorderRadius.circular(2),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(2),
                child: AnimatedBuilder(
                  animation: _controller,
                  builder: (context, child) {
                    return Container(
                      width: 256 * _controller.value,
                      height: 4,
                      decoration: BoxDecoration(
                        color: theme.colorScheme.primary,
                        borderRadius: BorderRadius.circular(2),
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _AnimatedBar extends StatelessWidget {
  final AnimationController controller;
  final double delay;

  const _AnimatedBar({required this.controller, required this.delay});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) {
        final progress = (controller.value + delay) % 1.0;
        final height = 20 + (sin(progress * 3.14159 * 2) * 20);
        return Container(
          width: 8,
          height: height,
          margin: const EdgeInsets.symmetric(horizontal: 4),
          decoration: BoxDecoration(
            color: theme.colorScheme.primary,
            borderRadius: BorderRadius.circular(4),
          ),
        );
      },
    );
  }
}
