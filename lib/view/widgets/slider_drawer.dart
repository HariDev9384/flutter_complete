

import '../../utils/utils.dart';

class SliderDrawer extends StatefulWidget {
  const SliderDrawer({super.key});

  @override
  State<SliderDrawer> createState() => _SliderDrawerState();
}

class _SliderDrawerState extends State<SliderDrawer> {
  @override
  Widget build(BuildContext context) {
    return  Drawer(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical:35.0,horizontal: 10),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      const CustomTypo(text: 'Welcome'),
                      Consumer<ThemeHelper>(
          builder: (context, theme, child) => 
          IconButton(
            onPressed: (){
              if(mounted){
              theme.toggleTheme();
              theme.notifyListeners();
              }
            }, icon: Icon((theme.islight())?Icons.light_mode_outlined:Icons.dark_mode_outlined)),
        ),
                    ],
                  )
                ],
              ),
            ),
            Expanded(
              flex: 4,
              child: Column(
                children: [
                  _rowButtonBuild(icon: const Icon(Icons.language), typo: const CustomTypo(text: 'Language'),onTap: (){}),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
  _rowButtonBuild({required Icon icon,required CustomTypo typo,required VoidCallback onTap}){
    return InkWell(
      onTap: onTap,
      child: Row(
        children: [
          Expanded(
            flex: 2,
            child: icon,
          ),
          Expanded(
            flex: 8,
            child: typo,
          )
        ],
      ),
    );
  }
}