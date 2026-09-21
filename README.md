# segmented_pill_control 💊

A fluid, Apple-grade sliding segmented pill control for Flutter featuring spring animations, notification badge counters, status dots, custom theming, and tactile haptic feedback.

Designed as a modern drop-in replacement for traditional Flutter `TabBar` and `CupertinoSlidingSegmentedControl` widgets.

[![pub package](https://img.shields.io/pub/v/segmented_pill_control.svg)](https://pub.dev/packages/segmented_pill_control)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

---

## ✨ Features

- 🍏 **Apple-Grade Sliding Physics:** The pill background glides smoothly beneath segments using customizable curves and spring animations.
- 🔴 **Integrated Notification Badges:** Display numeric counters (e.g. unread message count) or discrete notification dots directly within segments.
- 🎨 **Deep Visual Customization:** Configure container colors, active pill colors, shadows, borders, text typography, and inner padding via `PillTheme`.
- 📳 **Haptic Feedback:** Authentic tactile response on every segment change (`HapticFeedback.selectionClick()`).
- 🎛️ **Programmatic Controller (`SegmentedPillController`):** Seamlessly listen to and programmatically change active segments from outside the widget.
- ⚡ **Zero External Dependencies:** Built entirely with core Flutter primitives for maximum performance and zero dependency conflicts.

---

## 📦 Installation

Add to your project's `pubspec.yaml`:

```yaml
dependencies:
  segmented_pill_control: ^1.0.1
```

Or run:

```bash
flutter pub add segmented_pill_control
```

Then import the library:

```dart
import 'package:segmented_pill_control/segmented_pill_control.dart';
```

---

## 🚀 Usage Examples

### 1. Basic Segmented Control with Badges

```dart
SegmentedPillControl(
  initialIndex: 0,
  onChanged: (index) {
    print('Active tab: $index');
  },
  segments: const [
    PillSegment(
      label: 'Inbox',
      icon: Icon(Icons.inbox_outlined),
      activeIcon: Icon(Icons.inbox),
      badgeCount: 8,
    ),
    PillSegment(
      label: 'Starred',
      icon: Icon(Icons.star_outline),
      activeIcon: Icon(Icons.star),
      showBadgeDot: true,
      badgeColor: Colors.amber,
    ),
    PillSegment(
      label: 'Archive',
      icon: Icon(Icons.archive_outlined),
      activeIcon: Icon(Icons.archive),
    ),
  ],
)
```

---

### 2. Custom Dark Themed Financial Period Selector

```dart
SegmentedPillControl(
  initialIndex: 1,
  theme: PillTheme(
    backgroundColor: const Color(0xFF1E293B),
    selectedPillColor: const Color(0xFF3B82F6),
    selectedTextColor: Colors.white,
    unselectedTextColor: const Color(0xFF94A3B8),
    borderRadius: BorderRadius.circular(16),
    pillBorderRadius: BorderRadius.circular(12),
    animationDuration: const Duration(milliseconds: 220),
  ),
  segments: const [
    PillSegment(label: '1D'),
    PillSegment(label: '1W'),
    PillSegment(label: '1M'),
    PillSegment(label: '1Y'),
    PillSegment(label: 'ALL'),
  ],
  onChanged: (index) => updateChartPeriod(index),
)
```

---

### 3. Programmatic Navigation with Controller

```dart
class MyDashboard extends StatefulWidget {
  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  final SegmentedPillController _controller = SegmentedPillController(initialIndex: 0);

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        SegmentedPillControl(
          controller: _controller,
          segments: const [
            PillSegment(label: 'Overview', icon: Icon(Icons.dashboard_outlined)),
            PillSegment(label: 'Analytics', icon: Icon(Icons.analytics_outlined)),
            PillSegment(label: 'Settings', icon: Icon(Icons.settings_outlined)),
          ],
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () => _controller.animateTo(2),
          child: const Text('Jump to Settings Tab'),
        ),
      ],
    );
  }
}
```

---

## 🛠️ API Reference

### `SegmentedPillControl`

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `segments` | `List<PillSegment>` | **Required** | The list of segment items (minimum 2). |
| `initialIndex` | `int` | `0` | Starting selected segment index. |
| `controller` | `SegmentedPillController?` | `null` | Controller for programmatic tab manipulation. |
| `onChanged` | `ValueChanged<int>?` | `null` | Callback invoked when selected tab changes. |
| `theme` | `PillTheme` | `PillTheme()` | Visual appearance tokens and styling. |
| `enableHaptics` | `bool` | `true` | Whether selection triggers haptic feedback. |

### `PillSegment`

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `label` | `String` | **Required** | Text label for the segment. |
| `icon` | `Widget?` | `null` | Optional icon shown before the label. |
| `activeIcon` | `Widget?` | `null` | Optional icon shown when segment is active. |
| `badgeCount` | `int?` | `null` | Numeric badge displayed in a pill chip. |
| `showBadgeDot` | `bool` | `false` | Small indicator dot if badgeCount is null. |
| `badgeColor` | `Color?` | `Color(0xFFEF4444)` | Fill color for the badge chip or dot. |
| `badgeTextColor` | `Color?` | `Colors.white` | Text color for the numeric badge count. |
| `enabled` | `bool` | `true` | Whether this segment responds to taps. |

### `PillTheme`

| Property | Type | Default | Description |
| :--- | :--- | :--- | :--- |
| `backgroundColor` | `Color` | `Color(0xFFF1F5F9)` | Background color of the container. |
| `selectedPillColor` | `Color` | `Colors.white` | Color of the active sliding pill. |
| `selectedTextColor` | `Color` | `Color(0xFF0F172A)` | Text/icon color for the active segment. |
| `unselectedTextColor` | `Color` | `Color(0xFF64748B)` | Text/icon color for inactive segments. |
| `borderRadius` | `BorderRadius` | `BorderRadius.circular(24)` | Outer container corner radius. |
| `pillBorderRadius` | `BorderRadius` | `BorderRadius.circular(20)` | Sliding pill corner radius. |
| `pillShadow` | `List<BoxShadow>` | `[BoxShadow(...)]` | Elevation drop shadow beneath the pill. |
| `animationDuration` | `Duration` | `280ms` | Duration for sliding transition. |
| `animationCurve` | `Curve` | `Curves.easeOutCubic` | Curve used for sliding motion. |

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Author
Created by [Shahzain Baloch](https://github.com/ShahzainBaloch).
