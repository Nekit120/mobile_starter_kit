import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:go_router/go_router.dart';
import 'package:mobile_starter_kit/theme/theme_data.dart';
import 'core/domain/di/di_container.dart';
import 'core/domain/intl/generated/l10n.dart';
import 'core/presentation/keyboard_dismis.dart';
import 'feature/settings/domain/service/app_settings_bloc.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await DIContainer.instance.initDependencies();
  runApp(MainApp(
    appSettingsBloc: DIContainer.instance.get<AppSettingsBloc>(),
  ));
}

class MainApp extends StatefulWidget {
  final AppSettingsBloc appSettingsBloc;
  const MainApp({
    super.key,
    required this.appSettingsBloc,
  });

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> with WidgetsBindingObserver {
  @override
  Widget build(BuildContext context) {
    return BlocProvider.value(
      value: widget.appSettingsBloc,
      child: BlocBuilder<AppSettingsBloc, AppSettingsState>(
        bloc: widget.appSettingsBloc,
        builder: (context, state) {
          return KeyboardDismissOnTap(
            child: MaterialApp.router(
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              locale: widget.appSettingsBloc.currentLocale,
              supportedLocales: widget.appSettingsBloc.supportLocaleList,
              routerConfig: DIContainer.instance.get<GoRouter>(),
              theme: theme,
            ),
          );
        },
      ),
    );
  }
}
