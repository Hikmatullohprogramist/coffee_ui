import 'package:flutter/material.dart';

class CategoryItem extends StatefulWidget {
  final String name ;
  final String image;
  final bool isSelected;

  CategoryItem({super.key, required this.name, required this.image, required this.isSelected});

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
            color: widget.isSelected ? const Color(0xff583732) : Color(0xffD9D9D9),
          ),
          child: Center(child: Image.asset(widget.image)),

        ),
        Text(
          widget.name,
          textAlign: TextAlign.center,
          style: const TextStyle(
            color: Color(0xff583732),
            fontSize: 16,
            fontFamily: "Poppins",
            fontWeight: FontWeight.w600,
          ),
        )
      ],
    );
  }
}
