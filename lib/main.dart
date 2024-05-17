import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'package:sherif_nxt_assessment/core/theme/provider_theme/change_theme/theme_view_model.dart';
import 'core/provider_config/providers_list.dart';
import 'core/shared_preference/sharedpref_helper.dart';
import 'core/theme/themes.dart';
import 'navigation/custom_navigation.dart';
import 'navigation/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
        // this is the multi provider list to have all the change notifier provider over the app
    runApp(MultiProvider(
        providers: ProviderList.listOfProviders, child: const MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeViewModel>(builder: (context, viewModel, _) {
      // screen util package to use sp or w and h which make the the sized and number adaptive depending on the screen
      return ScreenUtilInit(
          designSize: const Size(1080, 1920),
          minTextAdapt: false,
          splitScreenMode: true,
          //  GlobalLoaderOverlay it make a screen outside for loading and it looks good
          builder: (BuildContext context, Widget? child) => GlobalLoaderOverlay(
            child: MaterialApp(
              debugShowCheckedModeBanner: false,
              theme: !viewModel.getTheme! ? darkTheme : lightTheme,
              navigatorKey: CustomNavigator.navigatorState,
              initialRoute: Routes.start,
              onGenerateRoute: CustomNavigator.onCreateRoute,
              navigatorObservers: [CustomNavigator.routeObserver],
            ),
          ));
    });
  }
}
