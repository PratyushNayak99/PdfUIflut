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
  late Animation<double> _progressAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(milliseconds: 2500),
      vsync: this,
    );
    _progressAnimation = Tween<double>(begin: 0, end: 1).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );
    _controller.forward();

    // Navigate to player after animation
    Future.delayed(const Duration(seconds: 3), () {
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
      child: Container(
        color: theme.scaffoldBackgroundColor,
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated waveform
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: List.generate(5, (index) {
                  return _AnimatedBar(
                    delay: index * 0.1,
                    controller: _controller,
                  );
                }),
              ),
              const SizedBox(height: 32),
              // Text
              Text(
                'Converting your PDF to audio...',
                style: theme.textTheme.titleMedium?.copyWith(
                  fontWeight: FontWeight.w500,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 8),
              Text(
                'This may take a moment',
                style: theme.textTheme.bodySmall?.copyWith(
                  color: theme.colorScheme.onSurface.withOpacity(0.6),
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 32),
              // Progress bar
              AnimatedBuilder(
                animation: _progressAnimation,
                builder: (context, child) {
                  return Container(
                    width: 256,
                    height: 4,
                    decoration: BoxDecoration(
                      color: theme.colorScheme.surfaceVariant,
                      borderRadius: BorderRadius.circular(2),
                    ),
                    child: Stack(
                      children: [
                        Container(
                          width: 256 * _progressAnimation.value,
                          height: 4,
                          decoration: BoxDecoration(
                            color: theme.colorScheme.primary,
                            borderRadius: BorderRadius.circular(2),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class _AnimatedBar extends StatefulWidget {
  final double delay;
  final AnimationController controller;

  const _AnimatedBar({required this.delay, required this.controller});

  @override
  State<_AnimatedBar> createState() => _AnimatedBarState();
}

class _AnimatedBarState extends State<_AnimatedBar>
    with SingleTickerProviderStateMixin {
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _animation = Tween<double>(begin: 20, end: 60).animate(
      CurvedAnimation(
        parent: widget.controller,
        curve: Interval(
          widget.delay.clamp(0.0, 1.0),
          (widget.delay + 0.5).clamp(0.0, 1.0),
          curve: Curves.easeInOut,
        ),
      ),
    )..addStatusListener((status) {
        if (status == AnimationStatus.completed) {
          _repeatAnimation();
        }
      });
  }

  void _repeatAnimation() {
    setState(() {
      _animation = Tween<double>(begin: 60, end: 20).animate(
        CurvedAnimation(
          parent: widget.controller,
          curve: Interval(
            widget.delay.clamp(0.0, 1.0),
            (widget.delay + 0.5).clamp(0.0, 1.0),
            curve: Curves.easeInOut,
          ),
        ),
      )..addStatusListener((status) {
          if (status == AnimationStatus.completed) {
            _repeatAnimation();
          }
        });
      widget.controller.forward(from: 0);
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          width: 8,
          height: _animation.value,
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
