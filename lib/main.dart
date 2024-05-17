import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:loader_overlay/loader_overlay.dart';
import 'package:provider/provider.dart';
import 'core/provider_config/providers_list.dart';
import 'core/shared_preference/sharedpref_helper.dart';
import 'core/utilities/theme/provider_theme/change_theme/theme_view_model.dart';
import 'core/utilities/theme/themes.dart';
import 'navigation/custom_navigation.dart';
import 'navigation/routes.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SharedPref.init();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp])
      .then((_) {
    runApp(MultiProvider(
        providers: ProviderList.listOfProviders, child: const MyApp()));
  });
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeViewModel>(builder: (context, viewModel, _) {
      return ScreenUtilInit(
          designSize: const Size(1080, 1920),
          minTextAdapt: false,
          splitScreenMode: true,
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
