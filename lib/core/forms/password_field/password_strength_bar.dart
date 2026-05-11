import 'package:flutter/material.dart';

import '../../extensions/context_extensions.dart';
import 'password_level.dart';

class PasswordStrengthBar extends StatelessWidget {
  const PasswordStrengthBar({super.key, required this.level});
  final PasswordLevel level;

  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 200),
      child: level != .none
          ? Row(
              spacing: 8.0,
              children: [
                Expanded(
                  child: Row(
                    spacing: 4.0,
                    children: List.generate(4, (index) => index)
                        .map(
                          (item) => Expanded(
                            child: AnimatedContainer(
                              duration: const Duration(milliseconds: 200),
                              height: 4.0,
                              decoration: BoxDecoration(
                                color: mapLevelToIndex(level) >= item
                                    ? context.colorScheme.primary
                                    : context.colorScheme.surfaceContainer,
                                borderRadius: .circular(999.0),
                              ),
                            ),
                          ),
                        )
                        .toList(),
                  ),
                ),
                SizedBox(
                  width: 50.0,
                  child: AnimatedSwitcher(
                    duration: const Duration(milliseconds: 200),
                    transitionBuilder: (child, animation) {
                      return FadeTransition(
                        opacity: animation,
                        child: SlideTransition(
                          position: Tween<Offset>(
                            begin: const Offset(0, 0.5),
                            end: Offset.zero,
                          ).animate(animation),
                          child: child,
                        ),
                      );
                    },
                    child: Text(
                      mapLevelToValue(level) ?? "N/A",
                      textAlign: .center,
                      key: ValueKey(level),
                      style: context.textTheme.labelLarge?.copyWith(
                        color: context.colorScheme.primary,
                      ),
                    ),
                  ),
                ),
              ],
            )
          : const SizedBox.shrink(),
    );
  }
}
