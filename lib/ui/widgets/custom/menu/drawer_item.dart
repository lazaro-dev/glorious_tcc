import 'package:flutter/material.dart';

class DrawerItem extends StatelessWidget {
  final IconData? icon;
  final String title;
  final void Function()? onTap;

  const DrawerItem({
    super.key,
    this.icon,
    required this.title,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      contentPadding: const EdgeInsets.symmetric(
        horizontal: 24,
        vertical: 8,
      ),
      leading: icon != null ? Icon(icon) : null,
      title: Text(title),
      onTap: onTap,
    );
  }
}
