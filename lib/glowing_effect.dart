import 'package:flutter/material.dart';

class GlowingEffect extends StatefulWidget {
  final Color color;

  const GlowingEffect({
    Key? key,
    required this.color,
  }) : super(key: key);

  @override
  State<GlowingEffect> createState() => _GlowingEffectState();
}

class _GlowingEffectState extends State<GlowingEffect>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(seconds: 2),
    )..repeat(reverse: true);
    _animation = Tween<double>(begin: 0.5, end: 1.0).animate(_controller);
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _animation,
      builder: (context, child) {
        return Container(
          decoration: BoxDecoration(
            shape: BoxShape.circle,
            boxShadow: [
              BoxShadow(
                color: widget.color.withOpacity(_animation.value * 0.5),
                blurRadius: 10 * _animation.value,
                spreadRadius: 5 * _animation.value,
              ),
            ],
          ),
        );
      },
    );
  }
}
