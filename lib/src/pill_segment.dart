import 'package:flutter/material.dart';

/// Defines an individual segment item inside a [SegmentedPillControl].
class PillSegment {
  /// Text label displayed on the segment.
  final String label;

  /// Optional icon widget displayed before the label.
  final Widget? icon;

  /// Optional replacement icon shown when this segment is currently active.
  final Widget? activeIcon;

  /// Optional numeric badge count displayed in a chip above/next to the label.
  final int? badgeCount;

  /// Whether to display a subtle indicator dot if [badgeCount] is null.
  final bool showBadgeDot;

  /// Background color of the badge indicator. Defaults to red/accent.
  final Color? badgeColor;

  /// Text color inside the badge chip. Defaults to white.
  final Color? badgeTextColor;

  /// Whether this segment is interactive. Defaults to `true`.
  final bool enabled;

  const PillSegment({
    required this.label,
    this.icon,
    this.activeIcon,
    this.badgeCount,
    this.showBadgeDot = false,
    this.badgeColor,
    this.badgeTextColor,
    this.enabled = true,
  });
}
