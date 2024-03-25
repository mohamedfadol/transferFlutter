import 'package:flutter/material.dart';

import '../../constants/constant.dart';
class CustomListTile extends StatelessWidget {
  final Widget? title;
  final Widget? leading;
  final Widget? trailing;
  final Widget?  subtitle;
  void Function()? onTap;

  CustomListTile({super.key, this.title, this.leading, this.trailing, this.subtitle, this.onTap});

  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
        shape: RoundedRectangleBorder(
          side: const BorderSide(width: 0.2, color: Colors.black45),
          borderRadius: BorderRadius.circular(8.0),
        ),
      title: title,
      subtitle: subtitle,
      leading: leading,
      trailing: trailing,

    );
  }
}
