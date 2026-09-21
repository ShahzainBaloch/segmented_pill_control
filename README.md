# segmented_pill_control

A fluid sliding segmented pill control for Flutter with spring animations, badge indicators, custom styling, and haptic feedback.

[![pub package](https://img.shields.io/pub/v/segmented_pill_control.svg)](https://pub.dev/packages/segmented_pill_control)
[![License: MIT](https://img.shields.io/badge/License-MIT-blue.svg)](https://opensource.org/licenses/MIT)

---

## ✨ Features

- 🍏 **Apple-Grade Sliding Animation**: Fluid sliding pill background with spring physics.
- 🔴 **Badge Counters & Status Dots**: Built-in support for numeric badges and notification dot indicators on individual segments.
- 🎨 **Deeply Customizable Theme**: Easily configure background colors, pill elevation, border radii, text styles, and shadows.
- 📳 **Haptic Feedback**: Crisp tactile feedback (`HapticFeedback.selectionClick()`) when switching segments.
- 🎛️ **Programmatic Controller**: Navigate tabs from code using `SegmentedPillController`.
- 🧹 **Zero External Dependencies**: Pure Flutter SDK implementation.

---

## 🚀 Getting Started

Add `segmented_pill_control` to your `pubspec.yaml`:

```yaml
dependencies:
  segmented_pill_control: ^1.0.0
```

Import the package:

```dart
import 'package:segmented_pill_control/segmented_pill_control.dart';
```

---

## 💡 Quick Example

```dart
SegmentedPillControl(
  initialIndex: 0,
  onChanged: (index) => print('Selected: $index'),
  segments: const [
    PillSegment(
      label: 'Inbox',
      icon: Icon(Icons.inbox),
      badgeCount: 5,
    ),
    PillSegment(
      label: 'Starred',
      icon: Icon(Icons.star),
      showBadgeDot: true,
    ),
    PillSegment(
      label: 'Archive',
      icon: Icon(Icons.archive),
    ),
  ],
)
```

---

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

### Author
Created by [Shahzain Baloch](https://github.com/ShahzainBaloch).
