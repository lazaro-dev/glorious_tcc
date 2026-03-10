import 'package:flutter/material.dart';

class UserDrawerHeader extends StatelessWidget {
  final String name;
  final String urlImage;

  const UserDrawerHeader({
    super.key,
    required this.name,
    required this.urlImage,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      color: Theme.of(context).primaryColor,
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(80),
            child: Image.network(
              urlImage,
              width: 100,
              height: 100,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Text(
                name,
                style: const TextStyle(
                  fontSize: 22,
                  color: Colors.white,
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
