import 'package:flutter/material.dart';

class DrawerItemWidget extends StatelessWidget {
  final String title;
  final IconData leadingIcon;
  final IconData trailingIcon;
  final Function onAction;
  const DrawerItemWidget(
      {super.key,
      required this.title,
      required this.leadingIcon,
      required this.trailingIcon,
      required this.onAction});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text(
        title,
        style: TextStyle(),
      ),
      leading: Icon(leadingIcon),
      trailing: Icon(trailingIcon),
      onTap: () => onAction(),
    );
  }
}
