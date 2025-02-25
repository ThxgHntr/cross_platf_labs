import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

import 'list_view/lab_item.dart';
import 'list_view/lab_item_list_view.dart';
import 'settings/settings_controller.dart';
import 'settings/settings_view.dart';
import 'lab1/lab1_view.dart';
import 'lab2/lab2_view.dart';
import 'lab3/lab3_view.dart';
import 'lab4/lab4_view.dart';
import 'lab5/lab5_view.dart';
import 'lab6/lab6_view.dart';

/// The Widget that configures your application.
class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
    required this.settingsController,
  });

  final SettingsController settingsController;

  @override
  Widget build(BuildContext context) {
    final List<LabItem> items = [
      LabItem(id: 1, image: Lab1View.image, routeName: Lab1View.routeName),
      LabItem(id: 2, image: Lab2View.image, routeName: Lab2View.routeName),
      LabItem(id: 3, image: Lab3View.image, routeName: Lab3View.routeName),
      LabItem(id: 4, image: Lab4View.image, routeName: Lab4View.routeName),
      LabItem(id: 5, image: Lab5View.image, routeName: Lab5View.routeName),
      LabItem(id: 6, image: Lab6View.image, routeName: Lab6View.routeName),
    ];
    // Glue the SettingsController to the MaterialApp.
    //
    // The ListenableBuilder Widget listens to the SettingsController for changes.
    // Whenever the user updates their settings, the MaterialApp is rebuilt.
    return ListenableBuilder(
      listenable: settingsController,
      builder: (BuildContext context, Widget? child) {
        return MaterialApp(
          // Providing a restorationScopeId allows the Navigator built by the
          // MaterialApp to restore the navigation stack when a user leaves and
          // returns to the app after it has been killed while running in the
          // background.
          restorationScopeId: 'app',

          // Provide the generated AppLocalizations to the MaterialApp. This
          // allows descendant Widgets to display the correct translations
          // depending on the user's locale.
          localizationsDelegates: const [
            AppLocalizations.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          supportedLocales: const [
            Locale('en', ''), // English, no country code
          ],

          // Use AppLocalizations to configure the correct application title
          // depending on the user's locale.
          //
          // The appTitle is defined in .arb files found in the localization
          // directory.
          onGenerateTitle: (BuildContext context) =>
              AppLocalizations.of(context)!.appTitle,

          // Define a light and dark color theme. Then, read the user's
          // preferred ThemeMode (light, dark, or system default) from the
          // SettingsController to display the correct theme.
          theme: ThemeData(),
          darkTheme: ThemeData.dark(),
          themeMode: settingsController.themeMode,

          // Define a function to handle named routes in order to support
          // Flutter web url navigation and deep linking.
          onGenerateRoute: (RouteSettings routeSettings) {
            return MaterialPageRoute<void>(
              settings: routeSettings,
              builder: (BuildContext context) {
                switch (routeSettings.name) {
                  case SettingsView.routeName:
                    return SettingsView(controller: settingsController);
                  case LabItemListView.routeName:
                    return LabItemListView(
                      items: items,
                    );
                  case Lab1View.routeName:
                    return const Lab1View();
                  case Lab2View.routeName:
                    return const Lab2View();
                  case Lab3View.routeName:
                    return const Lab3View();
                  case Lab4View.routeName:
                    return const Lab4View();
                  case Lab5View.routeName:
                    return const Lab5View();
                  case Lab6View.routeName:
                    return const Lab6View();
                  default:
                    return LabItemListView(
                      items: items,
                    );
                }
              },
            );
          },
        );
      },
    );
  }
}
