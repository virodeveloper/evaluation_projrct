import 'package:evaluation_projrct/main.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  testWidgets('Search Tile test', (WidgetTester tester) async {
    await tester.pumpWidget(const MyApp());

    final searchTitleFinder = find.text('Search');
    final searchTileFinder = find.text('Search Articles');
    final mostViewedTileFinder = find.text('Most Viewed');
    final mostSharedTileFinder = find.text('Most Shared');
    final mostEmailedFinder = find.text('Most Emailed');
    expect(searchTitleFinder, findsOneWidget);
    expect(searchTileFinder, findsOneWidget);
    expect(mostViewedTileFinder, findsOneWidget);
    expect(mostSharedTileFinder, findsOneWidget);
    expect(mostEmailedFinder, findsOneWidget);
  });
}
