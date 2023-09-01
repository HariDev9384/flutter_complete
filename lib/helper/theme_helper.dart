import 'package:complete/utils/utils.dart';

class ThemeHelper extends ChangeNotifier{
   
  ThemeData currentTheme = MyTheme.lightTheme; // Initialize with the light theme 
   ThemeData get currenttheme=>currentTheme;

  // Function to toggle between light and dark themes
   void toggleTheme() {
    currentTheme = currentTheme == MyTheme.lightTheme ? MyTheme.darkTheme : MyTheme.lightTheme;
    notifyListeners();
  }

  @override
  void notifyListeners() {
    super.notifyListeners();
  }

}