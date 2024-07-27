import 'package:flutter/material.dart';

class CustomSwitchListTile extends StatelessWidget {
  final String title;
  final String subtitle;
  final bool value;
  final ValueChanged<bool> onChanged;

  const CustomSwitchListTile({
    super.key,
    required this.title,
    required this.subtitle,
    required this.value,
    required this.onChanged,
  });

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      activeColor: const Color.fromRGBO(134, 91, 53, 1),
      title: Text(
        title,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed-Italic',
          fontSize: 17,
          color: Colors.black,
        ),
      ),
      subtitle: Text(
        subtitle,
        style: const TextStyle(
          fontFamily: 'RobotoCondensed-Italic',
          fontSize: 13,
          color: Color.fromARGB(129, 0, 0, 0),
        ),
      ),
      value: value,
      onChanged: onChanged,
    );
  }
}
