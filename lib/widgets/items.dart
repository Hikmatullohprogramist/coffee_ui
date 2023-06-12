import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  final String name ;
  final String image;
  final Color bacColor;

  const CategoryItem({super.key, required this.name, required this.image, required this.bacColor});

  @override
  State<CategoryItem> createState() => _CategoryItemState();
}

class _CategoryItemState extends State<CategoryItem> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: 79,
          height: 80,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: widget.bacColor,
          ),
          child: Center(child: Image.asset(widget.image)),

        ),
        Text(
          widget.name,
          textAlign: TextAlign.center,
          style:  TextStyle(
            color: widget.bacColor,
            fontSize: 16,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
