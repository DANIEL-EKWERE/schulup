import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:overlay_kit/overlay_kit.dart';
import 'package:schoolruns/core/network/connectivity_service.dart';
import 'core/app_export.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  ConnectivityService().startSyncListener();
  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
      statusBarIconBrightness: Brightness.dark,
    ),
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]).then((
    value,
  ) {
    Logger.init(kReleaseMode ? LogMode.live : LogMode.debug);
    runApp(MyApp());
  });
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Sizer(
      builder: (context, orientation, deviceType) {
        return OverlayKit(
          child: GetMaterialApp(
            debugShowCheckedModeBanner: false,
            theme: theme,
            translations: AppLocalization(),
            locale: Locale('en', ''),
            fallbackLocale: Locale('en', ''),
            title: 'school_runs',
            initialRoute: AppRoutes.initialRoute,
            getPages: AppRoutes.pages,
            builder: (context, child) {
              return MediaQuery(
                data: MediaQuery.of(
                  context,
                ).copyWith(textScaler: TextScaler.linear(1.0)),
                child: child!,
              );
            },
          ),
        );
      },
    );
  }
}
