import 'package:adv_test/presentation/router/app_router.dart';
import 'package:adv_test/presentation/router/routes.dart';
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'helper/resources/constant_resources.dart';
import 'helper/resources/dimension_resources.dart';
import 'helper/theme/app_theme.dart';
import 'helper/util/hive_utils.dart';
import 'helper/util/svg_utils.dart';

void main() async {

  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();

  await HiveBox().openBoxes();
  SvgUtils.preCacheSVGs();
  runApp(const MyApp());
}

final RouteObserver<PageRoute> routeObserver = RouteObserver<PageRoute>();


final GlobalKey<NavigatorState> globalNavigator = GlobalKey<NavigatorState>();

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final AppRouter appRouter = AppRouter();





  @override
  Widget build(BuildContext context) {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);


    return ScreenUtilInit(
      designSize: const Size(
        ConstantResources.APP_DESIGN_WIDTH,
        ConstantResources.APP_DESIGN_HEIGHT,
      ),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, child) {
        return MaterialApp(
          builder: (context, child) {
            return MediaQuery(
              data: MediaQuery.of(context).copyWith(
                textScaler: const TextScaler.linear(Dim.D_1),
              ),
              child: child ?? Container(),
            );
          },
          initialRoute: MAIN_SCREEN_ROUTE,
          debugShowCheckedModeBanner: false,
          navigatorKey: globalNavigator,
          theme: AppTheme.themeData,
          onGenerateRoute: appRouter.generateRoute,
          navigatorObservers: <NavigatorObserver>[routeObserver],
        );
      },
    );
  }

  @override
  void dispose() {
    appRouter.dispose();
    super.dispose();
  }
}