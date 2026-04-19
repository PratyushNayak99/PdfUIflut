import 'dart:math';
import 'package:flutter/material.dart';

class WaveformProgress extends StatefulWidget {
  final double progress;

  const WaveformProgress({super.key, this.progress = 35});

  @override
  State<WaveformProgress> createState() => _WaveformProgressState();
}

class _WaveformProgressState extends State<WaveformProgress> {
  late List<double> barHeights;

  @override
  void initState() {
    super.initState();
    final random = Random(42);
    barHeights = List.generate(40, (_) => 20 + random.nextDouble() * 60);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    
    return Column(
      children: [
        // Waveform bars
        SizedBox(
          height: 96,
          child: Row(
            children: List.generate(40, (index) {
              final isPlayed = index / 40 < widget.progress / 100;
              return Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 1),
                  height: barHeights[index],
                  decoration: BoxDecoration(
                    color: isPlayed
                        ? theme.colorScheme.primary
                        : theme.colorScheme.onSurface.withOpacity(0.2),
                    borderRadius: BorderRadius.circular(4),
                  ),
                ),
              );
            }),
          ),
        ),
        const SizedBox(height: 24),
        // Time display
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _formatTime((widget.progress / 100 * 720).toInt()),
              style: theme.textTheme.bodySmall,
            ),
            Text(
              _formatTime(720),
              style: theme.textTheme.bodySmall,
            ),
          ],
        ),
        const SizedBox(height: 16),
        // Custom slider track
        GestureDetector(
          onTapDown: (details) {
            // Handle seek - would be connected to audio player in production
          },
          child: Container(
            height: 4,
            decoration: BoxDecoration(
              color: theme.colorScheme.onSurface.withOpacity(0.2),
              borderRadius: BorderRadius.circular(2),
            ),
            child: Stack(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width * (widget.progress / 100),
                  decoration: BoxDecoration(
                    color: theme.colorScheme.primary,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  String _formatTime(int seconds) {
    final mins = seconds ~/ 60;
    final secs = seconds % 60;
    return '$mins:${secs.toString().padLeft(2, '0')}';
  }
}
