import 'package:flutter/foundation.dart';

/// Controller for reading and programmatically changing active segments.
class SegmentedPillController extends ChangeNotifier {
  int _index;

  SegmentedPillController({int initialIndex = 0}) : _index = initialIndex;

  /// The currently active segment index.
  int get index => _index;

  /// Updates the active index and triggers animations on attached widgets.
  void animateTo(int newIndex) {
    if (_index != newIndex) {
      _index = newIndex;
      notifyListeners();
    }
  }

  set index(int newIndex) => animateTo(newIndex);
}
