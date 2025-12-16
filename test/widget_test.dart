import 'package:flutter_test/flutter_test.dart';
import 'package:afarinick_test/main.dart';
import 'dart:io';

class _MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}

void main() {
  setUpAll(() {
    HttpOverrides.global = _MyHttpOverrides();
  });

  testWidgets('Login button navigates to Dashboard', (
    WidgetTester tester,
  ) async {
    // Build our app and trigger a frame.
    await tester.pumpWidget(const MyApp());

    // Verify that we are on Login Screen
    expect(find.text('Login'), findsOneWidget);

    // Tap the 'Login' button.
    await tester.tap(find.text('Login'));
    await tester.pumpAndSettle();

    // Verify that we are on Dashboard Screen
    expect(find.text('Welcome Kwabena!'), findsOneWidget);
    expect(find.text('to the HCMS App'), findsOneWidget);
  });
}
