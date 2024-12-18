import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

/// Removes the current focus and hides the keyboard when
/// the user taps on this widget.
///
/// Place this widget somewhere near the top of your widget
/// tree and when the user taps outside of a focused widget,
/// the focus will be removed and the keyboard will be hidden.
class KeyboardDismissOnTap extends StatefulWidget {
  /// Determines whether taps captures by other [Widget]s should dismiss the
  /// keyboard. Defaults to false.
  ///
  /// A common example of this is buttons. By default buttons
  /// capture the tap event and the keyboard won't be dismissed.
  final bool dismissOnCapturedTaps;

  const KeyboardDismissOnTap({
    super.key,
    required this.child,
    this.dismissOnCapturedTaps = false,
  });

  final Widget child;

  @override
  State<KeyboardDismissOnTap> createState() => _KeyboardDismissOnTapState();

  /// Used internally by [IgnoreKeyboardDismiss] to notify this Widget to ignore
  /// the next tap.
  static void ignoreNextTap(BuildContext context) {
    context
        .dependOnInheritedWidgetOfExactType<
            _KeyboardDismissOnTapInheritedWidget>()!
        .ignoreNextTap();
  }
}

class _KeyboardDismissOnTapState extends State<KeyboardDismissOnTap> {
  bool ignoreNextTap = false;

  void _hideKeyboard(BuildContext context, [PointerEvent? event]) {
    if (ignoreNextTap) {
      ignoreNextTap = false;
    } else {
      if (event == null) {
        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }
      } else {
        final rb = context.findRenderObject() as RenderBox;
        final result = BoxHitTestResult();
        rb.hitTest(result, position: event.position);

        for (final e in result.path) {
          final isScroll =
              e.target.runtimeType.toString().contains('RenderScrollSemantics');
          final isTextSelectionToolbar = e.target.runtimeType
              .toString()
              .contains('RenderTextSelectionToolbarItemsLayout');
          bool isTheatre =
              e.target.runtimeType.toString().contains('RenderTheatre');
          if (e.target is RenderEditable ||
              isScroll ||
              isTextSelectionToolbar ||
              isTheatre) {
            return;
          }
        }

        final currentFocus = FocusScope.of(context);
        if (!currentFocus.hasPrimaryFocus && currentFocus.hasFocus) {
          FocusManager.instance.primaryFocus?.unfocus();
        }

        final primaryFocus = FocusManager.instance.primaryFocus;

        if (primaryFocus?.context?.widget is EditableText &&
            !currentFocus.hasPrimaryFocus &&
            currentFocus.hasFocus) {
          primaryFocus?.unfocus();
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return _KeyboardDismissOnTapInheritedWidget(
      ignoreNextTap: () {
        ignoreNextTap = true;
      },
      child: widget.dismissOnCapturedTaps
          ? Listener(
              onPointerDown: (event) {
                _hideKeyboard(context, event);
              },
              behavior: HitTestBehavior.translucent,
              child: widget.child,
            )
          : GestureDetector(
              onTap: () {
                _hideKeyboard(context);
              },
              child: widget.child,
            ),
    );
  }
}

/// Used to ignore keyboard dismiss requests for a specific Widget or Widget
/// tree.
class IgnoreKeyboardDismiss extends StatelessWidget {
  final Widget child;

  const IgnoreKeyboardDismiss({
    super.key,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Listener(
      onPointerUp: (_) {
        KeyboardDismissOnTap.ignoreNextTap(context);
      },
      behavior: HitTestBehavior.translucent,
      child: child,
    );
  }
}

/// Used internally by [KeyboardDismissOnTap] and [IgnoreKeyboardDismiss] to
/// communicate ignore requests.
class _KeyboardDismissOnTapInheritedWidget extends InheritedWidget {
  const _KeyboardDismissOnTapInheritedWidget({
    required this.ignoreNextTap,
    required super.child,
  });

  final VoidCallback ignoreNextTap;

  @override
  bool updateShouldNotify(_KeyboardDismissOnTapInheritedWidget oldWidget) {
    return false;
  }
}
