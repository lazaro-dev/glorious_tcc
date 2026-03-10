import 'package:flutter/material.dart';

class CustomIconButton extends StatelessWidget {
  final IconData? iconData;
  final void Function()? onPressed;
  final void Function()? onTap;

  const CustomIconButton({
    super.key,
    this.iconData,
    this.onPressed,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: IconButton(
        onPressed: onPressed,
        icon: Icon(
          iconData,
          color: Theme.of(context).primaryColor,
        ),
        focusColor: Theme.of(context).primaryColor,
      ),
    );
  }
}
