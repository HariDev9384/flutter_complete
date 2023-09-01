

import '../../utils/utils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedLanguage = Languages.english;
  @override
  Widget build(BuildContext context) {
    var t=AppLocalizations.of(context); 
    return Scaffold(
      appBar: AppBar(
        title: Text('${t!.appTitle} ${t.localeName}'),
        leading: Consumer<ThemeHelper>(
          builder: (context, theme, child) => 
          IconButton(
            onPressed: (){
              if(mounted){
                theme.toggleTheme();
                theme.notifyListeners();
              }
            }, icon: Icon(theme.currentTheme==ThemeMode.light?Icons.light_mode_outlined:Icons.dark_mode_outlined)),
        ),
        ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height/1,
        width: MediaQuery.of(context).size.width/1,
        child: Column(
          children: [
            Row(
              children: [
                DropdownButton<String>(
            items: Languages().languages.map((language) {
              return DropdownMenuItem<String>(
                value: language,
                child: Text(language),
              );
            }).toList(),
            value: selectedLanguage,
            onChanged: (String? newValue) {
                // Update the selected language when the user makes a selection.
                  setState(() {
                  selectedLanguage = newValue!;
                  var localHelper=Provider.of<LocalizationHelper>(context,listen: false);
                  Locale newLocale=localHelper.langugetoLocale(selectedLanguage);
                  localHelper.storeLocale(newLocale);
                  localHelper.notifyListeners();
                      });
            },
          ),
          ElevatedButton(onPressed: (){}, child: const Text('data'))
              ],
            ),
          ],
        ),
      )
    );
  }
}