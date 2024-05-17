import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sherif_nxt_assessment/core/provider_config/providers_list.dart';
import 'package:sherif_nxt_assessment/core/shared_preference/sharedpref_helper.dart';
import 'package:sherif_nxt_assessment/core/utilities/constants.dart';
import 'package:sherif_nxt_assessment/presentation/start_view/start_view.dart';
// Create a mock implementation for GetsReservationProvider

Future<void> main() async {
  // Define the test case
  testWidgets('Open Reservation and navigate to ReservationView',
      (tester) async {
    SharedPreferences.setMockInitialValues({Constants.isDark: true});
    await SharedPref.init();
    await tester.pumpWidget(MultiProvider(
        providers: ProviderList.listOfProviders,
        child: ScreenUtilInit(
            designSize: const Size(1080, 1920),
            minTextAdapt: false,
            splitScreenMode: true,
            builder: (BuildContext context, Widget? child) {
              return const GlobalLoaderOverlay(
                  child: MaterialApp(home: StartView()));
            })));

    await tester.pump(const Duration(milliseconds: 500));
    // Act
    final openReservationButton = find.text('Open Reservation');
    await tester.ensureVisible(openReservationButton);
    await tester.tap(openReservationButton);
    await tester.pump();
    final Hotel = find.text('Show IOS Ticket');
    await tester.ensureVisible(Hotel);
    await tester.pump();
    //  // Assert
    expect(Hotel, findsOneWidget);
  });
}
