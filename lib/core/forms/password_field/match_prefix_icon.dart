import 'package:flutter/material.dart';
import 'package:heroicons/heroicons.dart';

import '../../extensions/context_extensions.dart';

class MatchPrefixIcon extends StatelessWidget {
  const MatchPrefixIcon({super.key, required ValueNotifier<bool?> isMatching})
    : _isMatching = isMatching;

  final ValueNotifier<bool?> _isMatching;

  @override
  Widget build(BuildContext context) {
    return ValueListenableBuilder(
      valueListenable: _isMatching,
      builder: (context, isMatching, _) {
        return AnimatedSwitcher(
          duration: const Duration(milliseconds: 200),
          transitionBuilder: (child, animation) => FadeTransition(
            opacity: animation,
            child: ScaleTransition(scale: animation, child: child),
          ),
          child: isMatching == null
              ? const HeroIcon(.lockClosed, key: ValueKey('lock'))
              : isMatching
              ? const HeroIcon(
                  .checkCircle,
                  key: ValueKey('check'),
                  color: Colors.green,
                )
              : HeroIcon(
                  .xCircle,
                  key: const ValueKey('error'),
                  color: context.colorScheme.error,
                ),
        );
      },
    );
  }
}
