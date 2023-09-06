import '../../utils/utils.dart';

class CustomTypo extends StatelessWidget {
  final String text;
  final TextStyle? style;

  const CustomTypo({
    Key? key,
    required this.text,
    this.style, // Make 'style' parameter optional
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: style,
    );
  }
}
