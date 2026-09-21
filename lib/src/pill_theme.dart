import 'package:flutter/material.dart';

/// Visual styling configuration for [SegmentedPillControl].
class PillTheme {
  /// Container outer background color.
  final Color backgroundColor;

  /// Sliding pill indicator background color.
  final Color selectedPillColor;

  /// Text and icon color for inactive segments.
  final Color unselectedTextColor;

  /// Text and icon color for the active segment.
  final Color selectedTextColor;

  /// Border radius of the outer container.
  final BorderRadius borderRadius;

  /// Border radius of the active sliding pill indicator.
  final BorderRadius pillBorderRadius;

  /// Outer padding around all segments.
  final EdgeInsetsGeometry padding;

  /// Inner padding inside each individual segment.
  final EdgeInsetsGeometry segmentPadding;

  /// Drop shadow applied beneath the active sliding pill.
  final List<BoxShadow> pillShadow;

  /// Duration for sliding animations.
  final Duration animationDuration;

  /// Animation curve for the sliding pill motion.
  final Curve animationCurve;

  const PillTheme({
    this.backgroundColor = const Color(0xFFF1F5F9),
    this.selectedPillColor = Colors.white,
    this.unselectedTextColor = const Color(0xFF64748B),
    this.selectedTextColor = const Color(0xFF0F172A),
    this.borderRadius = const BorderRadius.all(Radius.circular(24.0)),
    this.pillBorderRadius = const BorderRadius.all(Radius.circular(20.0)),
    this.padding = const EdgeInsets.all(4.0),
    this.segmentPadding =
        const EdgeInsets.symmetric(horizontal: 16.0, vertical: 10.0),
    this.pillShadow = const [
      BoxShadow(
        color: Color(0x1A000000),
        blurRadius: 8.0,
        offset: Offset(0, 2),
      ),
    ],
    this.animationDuration = const Duration(milliseconds: 280),
    this.animationCurve = Curves.easeOutCubic,
  });
}
