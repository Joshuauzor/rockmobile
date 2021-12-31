import 'package:flutter/widgets.dart';

class TouchableOpacity extends StatefulWidget {
  const TouchableOpacity({
    required this.child,
    required this.onTap,
    this.behavior = HitTestBehavior.opaque,
    this.disabled = false,
    Key? key,
  }) : super(key: key);
  final Widget child;
  final VoidCallback onTap;
  final HitTestBehavior behavior;
  final bool disabled;

  @override
  _TouchableOpacity createState() => _TouchableOpacity();
}

class _TouchableOpacity extends State<TouchableOpacity> {
  bool isTappedDown = false;

  @override
  Widget build(BuildContext context) {
    return RepaintBoundary(
      child: GestureDetector(
        behavior: widget.behavior,
        onTapCancel: () {
          setState(() {
            isTappedDown = false;
          });
        },
        onTap: widget.disabled ? null : widget.onTap,
        child: Opacity(
          opacity: isTappedDown ? 0.6 : 1.0,
          child: Container(
            child: widget.child,
          ),
        ),
      ),
    );
  }
}
