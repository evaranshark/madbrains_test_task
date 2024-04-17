import 'package:flutter/material.dart';

class AppBarMainRow extends StatefulWidget {
  const AppBarMainRow({
    super.key,
    required this.controller,
    required this.initialCollapsed,
    this.focusNode,
  });
  final TextEditingController controller;
  final bool initialCollapsed;
  final FocusNode? focusNode;

  @override
  State<AppBarMainRow> createState() => _AppBarMainRowState();
}

class _AppBarMainRowState extends State<AppBarMainRow>
    with SingleTickerProviderStateMixin {
  late bool _isSearchActive;
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _isSearchActive = !widget.initialCollapsed;
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 400),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  void switchAnimation() {
    setState(() {
      _isSearchActive = !_isSearchActive;
      _isSearchActive ? _controller.forward() : _controller.reverse();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.max,
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Flexible(
          child: ConstrainedBox(
            constraints: const BoxConstraints(
              minWidth: 40.0,
              maxWidth: 300.0,
              maxHeight: 40.0,
            ),
            child: AnimatedSwitcher(
              duration: const Duration(milliseconds: 400),
              child: _isSearchActive
                  ? TextField(
                      focusNode: widget.focusNode,
                      controller: widget.controller,
                      style: Theme.of(context).textTheme.bodyLarge,
                      decoration: InputDecoration(
                        prefixIcon: IconButton(
                          icon: const Icon(Icons.search),
                          onPressed: switchAnimation,
                        ),
                      ),
                    )
                  : IconButton(
                      onPressed: switchAnimation,
                      icon: const Icon(Icons.search),
                    ),
            ),
          ),
        ),
        if (!_isSearchActive) const Text('Объекты'),
        IconButton(
          icon: const Icon(Icons.info_outline_rounded),
          onPressed: () {},
        ),
      ],
    );
  }
}
