import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'pill_segment.dart';
import 'pill_theme.dart';
import 'segmented_pill_controller.dart';

/// A fluid sliding segmented pill control widget.
class SegmentedPillControl extends StatefulWidget {
  /// The list of segments to display.
  final List<PillSegment> segments;

  /// The initially selected index. Ignored if [controller] is provided.
  final int initialIndex;

  /// Optional controller for programmatic tab changes.
  final SegmentedPillController? controller;

  /// Callback fired when active segment selection changes.
  final ValueChanged<int>? onChanged;

  /// Visual theme customization.
  final PillTheme theme;

  /// Whether to trigger haptic feedback on tab changes. Defaults to `true`.
  final bool enableHaptics;

  const SegmentedPillControl({
    super.key,
    required this.segments,
    this.initialIndex = 0,
    this.controller,
    this.onChanged,
    this.theme = const PillTheme(),
    this.enableHaptics = true,
  });

  @override
  State<SegmentedPillControl> createState() => _SegmentedPillControlState();
}

class _SegmentedPillControlState extends State<SegmentedPillControl> {
  late int _currentIndex;

  @override
  void initState() {
    super.initState();
    assert(widget.segments.length > 1,
        'SegmentedPillControl requires at least 2 segments.');
    _currentIndex = widget.controller?.index ?? widget.initialIndex;
    widget.controller?.addListener(_onControllerChanged);
  }

  @override
  void didUpdateWidget(covariant SegmentedPillControl oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (widget.controller != oldWidget.controller) {
      oldWidget.controller?.removeListener(_onControllerChanged);
      widget.controller?.addListener(_onControllerChanged);
      if (widget.controller != null) {
        _currentIndex = widget.controller!.index;
      }
    }
  }

  @override
  void dispose() {
    widget.controller?.removeListener(_onControllerChanged);
    super.dispose();
  }

  void _onControllerChanged() {
    if (widget.controller != null &&
        widget.controller!.index != _currentIndex) {
      setState(() {
        _currentIndex = widget.controller!.index;
      });
    }
  }

  void _onSegmentTapped(int index) {
    if (!widget.segments[index].enabled || _currentIndex == index) return;

    if (widget.enableHaptics) {
      HapticFeedback.selectionClick();
    }

    setState(() {
      _currentIndex = index;
    });

    widget.controller?.animateTo(index);
    widget.onChanged?.call(index);
  }

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        final totalWidth = constraints.maxWidth;
        final count = widget.segments.length;
        final segmentWidth = (totalWidth - 8.0) / count;

        return Container(
          padding: widget.theme.padding,
          decoration: BoxDecoration(
            color: widget.theme.backgroundColor,
            borderRadius: widget.theme.borderRadius,
          ),
          child: Stack(
            children: [
              // Sliding Active Pill Background
              AnimatedPositioned(
                duration: widget.theme.animationDuration,
                curve: widget.theme.animationCurve,
                left: _currentIndex * segmentWidth,
                top: 0,
                bottom: 0,
                width: segmentWidth,
                child: Container(
                  decoration: BoxDecoration(
                    color: widget.theme.selectedPillColor,
                    borderRadius: widget.theme.pillBorderRadius,
                    boxShadow: widget.theme.pillShadow,
                  ),
                ),
              ),

              // Segment Interaction Rows
              Row(
                children: List.generate(count, (index) {
                  final segment = widget.segments[index];
                  final isSelected = _currentIndex == index;

                  return Expanded(
                    child: GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => _onSegmentTapped(index),
                      child: Container(
                        padding: widget.theme.segmentPadding,
                        alignment: Alignment.center,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            // Icon
                            if (isSelected && segment.activeIcon != null)
                              Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: IconTheme(
                                  data: IconThemeData(
                                    color: widget.theme.selectedTextColor,
                                    size: 16,
                                  ),
                                  child: segment.activeIcon!,
                                ),
                              )
                            else if (segment.icon != null)
                              Padding(
                                padding: const EdgeInsets.only(right: 4.0),
                                child: IconTheme(
                                  data: IconThemeData(
                                    color: isSelected
                                        ? widget.theme.selectedTextColor
                                        : widget.theme.unselectedTextColor,
                                    size: 16,
                                  ),
                                  child: segment.icon!,
                                ),
                              ),

                            // Label
                            Flexible(
                              child: AnimatedDefaultTextStyle(
                                duration: widget.theme.animationDuration,
                                curve: Curves.easeOut,
                                style: TextStyle(
                                  color: isSelected
                                      ? widget.theme.selectedTextColor
                                      : widget.theme.unselectedTextColor,
                                  fontWeight: isSelected
                                      ? FontWeight.bold
                                      : FontWeight.w500,
                                  fontSize: 13,
                                ),
                                child: Text(
                                  segment.label,
                                  maxLines: 1,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ),

                            // Badge count or Dot
                            if (segment.badgeCount != null &&
                                segment.badgeCount! > 0) ...[
                              const SizedBox(width: 4),
                              Container(
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 5.0,
                                  vertical: 1.5,
                                ),
                                decoration: BoxDecoration(
                                  color: segment.badgeColor ??
                                      const Color(0xFFEF4444),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Text(
                                  '${segment.badgeCount}',
                                  style: TextStyle(
                                    color: segment.badgeTextColor ??
                                        Colors.white,
                                    fontSize: 9,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ] else if (segment.showBadgeDot) ...[
                              const SizedBox(width: 4),
                              Container(
                                width: 6,
                                height: 6,
                                decoration: BoxDecoration(
                                  color: segment.badgeColor ??
                                      const Color(0xFFEF4444),
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ),
                    ),
                  );
                }),
              ),
            ],
          ),
        );
      },
    );
  }
}
