import 'package:countup/design/style.dart';
import 'package:flutter/material.dart';

class AnimatedText extends StatefulWidget {
  const AnimatedText({super.key, required this.text});
  final String text;

  @override
  State<AnimatedText> createState() => _AnimatedTextState();
}

class _AnimatedTextState extends State<AnimatedText>
    with SingleTickerProviderStateMixin {
  late String _lastText;
  late final AnimationController _controller;
  late final Animation _value;
  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 200),
    );
    _value = Tween<double>(begin: 1, end: 0).animate(_controller);
    // _animateText();
    _lastText = widget.text;
  }

  @override
  void dispose() {
    // TODO: implement dispose
    _controller.dispose();
    super.dispose();
  }

  @override
  void didUpdateWidget(covariant AnimatedText oldWidget) {
    _animateText();
    super.didUpdateWidget(oldWidget);
  }

  void _animateText() {
    _controller.forward();
    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _lastText = widget.text;
        Future.delayed(const Duration(milliseconds: 100))
            .then((value) => _controller.reverse());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: _controller,
      builder: (BuildContext context, _) {
        return Opacity(
          opacity: _value.value,
          child: Text(
            _lastText,
            style: CustomTextStyle.titleStyle,
          ),
        );
      },
    );
  }
}
