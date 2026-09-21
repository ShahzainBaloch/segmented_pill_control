import 'package:flutter/material.dart';
import 'package:segmented_pill_control/segmented_pill_control.dart';

void main() {
  runApp(const SegmentedPillExampleApp());
}

class SegmentedPillExampleApp extends StatelessWidget {
  const SegmentedPillExampleApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Segmented Pill Control Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: const Color(0xFF3B82F6),
          brightness: Brightness.light,
        ),
        useMaterial3: true,
      ),
      home: const PillDemoScreen(),
    );
  }
}

class PillDemoScreen extends StatefulWidget {
  const PillDemoScreen({super.key});

  @override
  State<PillDemoScreen> createState() => _PillDemoScreenState();
}

class _PillDemoScreenState extends State<PillDemoScreen> {
  int _selectedFilter = 0;
  int _selectedPeriod = 1;
  final SegmentedPillController _controller = SegmentedPillController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF8FAFC),
      appBar: AppBar(
        title: const Text(
          'Segmented Pill Control',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'iOS Mail Style with Badges',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            SegmentedPillControl(
              initialIndex: _selectedFilter,
              onChanged: (idx) => setState(() => _selectedFilter = idx),
              segments: const [
                PillSegment(
                  label: 'Primary',
                  icon: Icon(Icons.inbox_outlined),
                  activeIcon: Icon(Icons.inbox),
                  badgeCount: 12,
                ),
                PillSegment(
                  label: 'Social',
                  icon: Icon(Icons.people_outline),
                  activeIcon: Icon(Icons.people),
                  badgeCount: 4,
                  badgeColor: Color(0xFF3B82F6),
                ),
                PillSegment(
                  label: 'Promos',
                  icon: Icon(Icons.local_offer_outlined),
                  activeIcon: Icon(Icons.local_offer),
                  showBadgeDot: true,
                  badgeColor: Color(0xFF10B981),
                ),
              ],
            ),
            const SizedBox(height: 32),

            const Text(
              'Dark Minimalist Financial Period',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            SegmentedPillControl(
              initialIndex: _selectedPeriod,
              onChanged: (idx) => setState(() => _selectedPeriod = idx),
              theme: PillTheme(
                backgroundColor: const Color(0xFF1E293B),
                selectedPillColor: const Color(0xFF3B82F6),
                selectedTextColor: Colors.white,
                unselectedTextColor: const Color(0xFF94A3B8),
                borderRadius: BorderRadius.circular(16),
                pillBorderRadius: BorderRadius.circular(12),
              ),
              segments: const [
                PillSegment(label: '1D'),
                PillSegment(label: '1W'),
                PillSegment(label: '1M'),
                PillSegment(label: '1Y'),
                PillSegment(label: 'ALL'),
              ],
            ),
            const SizedBox(height: 32),

            const Text(
              'Controlled via Controller',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16),
            ),
            const SizedBox(height: 12),
            SegmentedPillControl(
              controller: _controller,
              segments: const [
                PillSegment(label: 'Overview', icon: Icon(Icons.dashboard_outlined)),
                PillSegment(label: 'Analytics', icon: Icon(Icons.analytics_outlined)),
                PillSegment(label: 'Settings', icon: Icon(Icons.settings_outlined)),
              ],
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                OutlinedButton(
                  onPressed: () => _controller.animateTo(0),
                  child: const Text('Go to 0'),
                ),
                OutlinedButton(
                  onPressed: () => _controller.animateTo(1),
                  child: const Text('Go to 1'),
                ),
                OutlinedButton(
                  onPressed: () => _controller.animateTo(2),
                  child: const Text('Go to 2'),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
