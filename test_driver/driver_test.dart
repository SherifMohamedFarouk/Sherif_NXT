
import 'package:flutter_driver/flutter_driver.dart';
import 'package:test/test.dart';

Future<void> main() async {

  group('reservation button tested', () {
    final buttonFinder = find.text('Open Reservation');
    final changeThemeSwitch = find.byValueKey('changeTheme');
    final bottomAndroidSheet = find.text('Show Android Ticket');
    final bottomIosSheet = find.text('Show IOS Ticket');
    final hotelTextFinder =  find.text("Hotel Check-in");
    final expandFinder =  find.byValueKey("reservation0");
    late FlutterDriver driver;

    // Connect Flutter Driver to the app before executing the tests
    setUpAll(() async {
      driver = await FlutterDriver.connect();
    });

    // Disconnect Flutter Driver from the app after executing the tests
    tearDownAll(() async {
      driver.close();
    });

    test('open', () async {
      // Ensure the switch is present

      await driver.waitFor(changeThemeSwitch);
      // Tap the switch to toggle it
      await Future.delayed(const Duration(seconds: 1,));
      await driver.tap(changeThemeSwitch);
      await Future.delayed(const Duration(seconds: 1,));
      await driver.tap(changeThemeSwitch);
      await Future.delayed(const Duration(seconds: 2,));
      await driver.waitFor(buttonFinder);
      await Future.delayed(const Duration(milliseconds: 500));
      await driver.tap(buttonFinder);
      await Future.delayed(const Duration(seconds: 1,));
      await driver.waitFor(hotelTextFinder);
      await Future.delayed(const Duration(milliseconds: 500));
      // try to check if the list reservation is not empty
      try{
        await driver.waitFor(expandFinder, timeout: const Duration(seconds: 2));
        await Future.delayed(const Duration(milliseconds: 500));
        await driver.tap(expandFinder);
        await Future.delayed(const Duration(milliseconds: 500));
        await driver.scroll(hotelTextFinder, 0, -1000, const Duration(seconds: 1));
        await Future.delayed(const Duration(seconds: 1,));
        await driver.scrollIntoView(hotelTextFinder);
        await driver.scroll(hotelTextFinder, 0, 1000, const Duration(seconds: 1));
        await Future.delayed(const Duration(seconds: 1,));
        await driver.waitFor(bottomAndroidSheet);
        await Future.delayed(const Duration(milliseconds: 500));
        await driver.tap(bottomAndroidSheet);
        await Future.delayed(const Duration(seconds: 2,));
      }catch(error){
        await driver.scroll(hotelTextFinder, 0, 1000, const Duration(seconds: 2));
      }
    });
  });

}
