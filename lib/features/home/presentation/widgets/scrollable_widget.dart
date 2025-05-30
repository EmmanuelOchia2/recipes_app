import 'dart:developer';

import 'package:flutter/material.dart';

class ScrollableWidget extends StatefulWidget {
  const ScrollableWidget({
    required this.children,
    required this.callback,
    this.isNested = false,
    super.key,
  });
  final List<Widget> children;
  final VoidCallback? callback;
  final bool isNested;
  @override
  State<ScrollableWidget> createState() => _ScrollableWidgetState();
}

class _ScrollableWidgetState extends State<ScrollableWidget> {
  final controller = ScrollController();
  @override
  void initState() {
    controller.addListener(_onScroll);
    super.initState();
  }

  void _onScroll() {
    log('position ${controller.position.pixels}');
    if (controller.position.pixels >=
        controller.position.maxScrollExtent - 200) {
      if (widget.callback != null) widget.callback!();
    }
  }

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: widget.isNested,
      controller: controller,
      children: widget.children,
    );
  }

  @override
  void dispose() {
    controller.removeListener(_onScroll);
    controller.dispose();
    super.dispose();
  }
}
