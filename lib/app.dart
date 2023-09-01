

import 'utils/utils.dart';

intialize()=> runApp(MultiProvider(providers:MyProvider().providers,child: const MyApp()));



class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return  Consumer2<LocalizationHelper,ThemeHelper>(
      builder: (context, locale,theme, child) => 
       MaterialApp(
       theme: theme.currentTheme,
       debugShowCheckedModeBanner: false,
       onGenerateTitle: (BuildContext context) => AppLocalizations.of(context)!.appTitle,
       localizationsDelegates: AppLocalizations.localizationsDelegates,
       supportedLocales: AppLocalizations.supportedLocales,
       locale: locale.defaultLocale, // Set English (us) as default
       home: const Home(),
      ),
    );
  }
}