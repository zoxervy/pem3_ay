import 'package:flutter_test/flutter_test.dart';
import 'package:pertemuan04/main.dart';

void main() {
  testWidgets('Pendaftaran Workshop smoke test', (WidgetTester tester) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that the title and first step form is loaded.
    expect(find.text('Pendaftaran Workshop Coding'), findsWidgets);
    expect(find.text('Data Diri Peserta'), findsOneWidget);
  });
}
