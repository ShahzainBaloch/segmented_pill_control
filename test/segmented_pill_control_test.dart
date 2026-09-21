import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:segmented_pill_control/segmented_pill_control.dart';

void main() {
  testWidgets('SegmentedPillControl renders labels and badges', (tester) async {
    await tester.pumpWidget(
      const MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 400,
            child: SegmentedPillControl(
              segments: [
                PillSegment(label: 'All'),
                PillSegment(label: 'Unread', badgeCount: 5),
                PillSegment(label: 'Starred', showBadgeDot: true),
              ],
            ),
          ),
        ),
      ),
    );

    expect(find.text('All'), findsOneWidget);
    expect(find.text('Unread'), findsOneWidget);
    expect(find.text('5'), findsOneWidget);
    expect(find.text('Starred'), findsOneWidget);
  });

  testWidgets('Tapping segment fires onChanged callback', (tester) async {
    int selected = 0;

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 400,
            child: SegmentedPillControl(
              onChanged: (idx) => selected = idx,
              segments: const [
                PillSegment(label: 'Day'),
                PillSegment(label: 'Week'),
                PillSegment(label: 'Month'),
              ],
            ),
          ),
        ),
      ),
    );

    await tester.tap(find.text('Week'));
    await tester.pumpAndSettle();

    expect(selected, equals(1));
  });

  testWidgets('Controller changes active segment programmatically',
      (tester) async {
    final controller = SegmentedPillController(initialIndex: 0);

    await tester.pumpWidget(
      MaterialApp(
        home: Scaffold(
          body: SizedBox(
            width: 400,
            child: SegmentedPillControl(
              controller: controller,
              segments: const [
                PillSegment(label: 'Feed'),
                PillSegment(label: 'Trending'),
              ],
            ),
          ),
        ),
      ),
    );

    expect(controller.index, equals(0));

    controller.animateTo(1);
    await tester.pumpAndSettle();

    expect(controller.index, equals(1));
  });
}
