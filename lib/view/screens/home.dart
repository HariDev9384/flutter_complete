

import '../../utils/utils.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  String selectedLanguage = Languages.english;
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) =>fetch());
  }
  fetch() async {
    if(mounted){
    var prov= Provider.of<ProductsViewModel>(context,listen: false);
    await prov.fetchProductListApi();
    }
  }
  @override
  Widget build(BuildContext context) {
    var t=AppLocalizations.of(context); 
    return Scaffold(
      drawer: const SliderDrawer(),
      appBar: AppBar(
        title: Text('${t!.appTitle} ${t.localeName}'),
        ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height/1,
        width: MediaQuery.of(context).size.width/1,
        child: Column(
          children: [
            IconButton(onPressed: fetch, icon: const Icon(Icons.send)),
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
            onChanged: (String? newValue) async{
                // Update the selected language when the user makes a selection.
                  selectedLanguage = newValue!;
                  var localHelper=Provider.of<LocalizationHelper>(context,listen: false);
                  Locale newLocale=localHelper.langugetoLocale(selectedLanguage);
                  await localHelper.storeLocale(newLocale);
                  localHelper.notifyListeners();
                  setState(() {
                    
                  });
            },
          ),
          ElevatedButton(onPressed:()async=>fetch(), child: const Text('data'))
              ],
            ),
          ],
        ),
      )
    );
  }
}