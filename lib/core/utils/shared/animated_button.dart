import 'package:flutter/material.dart';

class AnimatedButton extends StatefulWidget {
  final Widget Function(bool? isHaver) child;
  // The child widget to display inside the button
  final VoidCallback? onTap; // Callback for button press
  final double hoverScale; // Scale factor on hover
  final double pressScale; // Scale factor on press
  final Duration animationDuration; // Animation duration
  final bool? isWithPress;
  final MouseCursor? cursor;

  const AnimatedButton({
    super.key,
    required this.child,
    this.onTap,
    this.hoverScale = 1.1,
    this.pressScale = 0.9,
    this.animationDuration = const Duration(milliseconds: 150),
    this.isWithPress = true,
    this.cursor = SystemMouseCursors.click,
  });

  @override
  State<StatefulWidget> createState() => _AnimatedButtonState();
}

class _AnimatedButtonState extends State<AnimatedButton> {
  double _scale = 1.0;
  bool isHover = false;

  void _onEnter(PointerEvent details) {
    isHover = true;
    setState(() => _scale = widget.hoverScale);
  }

  void _onExit(PointerEvent details) {
    isHover = false;
    setState(() => _scale = 1.0);
  }

  void _onTapDown(TapDownDetails details) {
    setState(() => _scale = widget.pressScale);
  }

  void _onTapUp(TapUpDetails details) {
    setState(() => _scale = 1.0);
    if (widget.onTap != null) widget.onTap!();
  }

  void _onTapCancel() {
    setState(() => _scale = 1.0);
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTapDown: widget.isWithPress! ? _onTapDown : null,
      onTapUp: widget.isWithPress! ? _onTapUp : null,
      onTapCancel: _onTapCancel,
      child: MouseRegion(
        cursor: widget.cursor!,
        onEnter: _onEnter,
        onExit: _onExit,
        child: AnimatedScale(
          scale: _scale,
          duration: widget.animationDuration,
          curve: Curves.easeOut,
          child: widget.child(isHover),
        ),
      ),
    );
  }
}
