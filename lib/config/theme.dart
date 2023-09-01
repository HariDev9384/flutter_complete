import '../utils/utils.dart';

class MyTheme {
  static ThemeData lightTheme = ThemeData(
    colorScheme: const ColorScheme.light(
      brightness: Brightness.light,
      primary: Color(0xffE00F12),
      onPrimary: Color(0xffffffff),
      primaryContainer: Color(0xffe6deff),
      onPrimaryContainer: Color(0xff1b015f),
      secondary: Color(0xff605c71),
      onSecondary: Color(0xffffffff),
      secondaryContainer: Color(0xffe6dff9),
      onSecondaryContainer: Color(0xff1c192b),
      tertiary: Color(0xff7c5264),
      onTertiary: Color(0xffffffff),
      tertiaryContainer: Color(0xffffd8e6),
      onTertiaryContainer: Color(0xff301120),
      error: Color(0xffba1a1a),
      onError: Color(0xffffffff),
      errorContainer: Color(0xffffdad6),
      onErrorContainer: Color(0xff410002),
      background: Color(0xfffffbff),
      onBackground: Color(0xff1c1b1f),
      surface: Color(0xfffffbff),
      onSurface: Color(0xff1c1b1f),
      surfaceVariant: Color(0xffe6e0ec),
      onSurfaceVariant: Color(0xff48454e),
      outline: Color(0xff48454e),
      shadow: Color(0xff000000),
      inverseSurface: Color(0xff313033),
      onInverseSurface: Color(0xffe8e3e8),
      inversePrimary: Color(0xffc9beff),
    )
  );

  static ThemeData darkTheme = ThemeData.dark(
    
  );

}
