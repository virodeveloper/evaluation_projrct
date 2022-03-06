import 'package:flutter/material.dart';

class CustomRowItem extends StatelessWidget {
  const CustomRowItem({
    required this.itemTitle,
    required this.onTap,
    Key? key,
  }) : super(key: key);

  final String itemTitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        GestureDetector(
          onTap: onTap,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(itemTitle),
              const Icon(Icons.arrow_forward_ios_rounded),
            ],
          ),
        ),
        const Divider(),
      ],
    );
  }
}
