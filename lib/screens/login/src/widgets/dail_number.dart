import 'package:flutter/material.dart';
import 'package:local_hero/local_hero.dart';
import '../rotational_dailer/constant.dart';


const _dialNumberRadius = RotaryDialConstants.rotaryRingWidth / 2 -
    (RotaryDialConstants.rotaryRingPadding +
        RotaryDialConstants.dialNumberPadding);

class DialNumber extends StatelessWidget {
  const DialNumber({
    required this.number,
    super.key,
  });

  final int number;

  @override
  Widget build(BuildContext context) {
    return LocalHero(
      tag: 'digit_$number',
      child: Container(
        height: _dialNumberRadius * 2,
        width: _dialNumberRadius * 2,
        alignment: Alignment.center,
        decoration: const BoxDecoration(
          color: Colors.white,
          shape: BoxShape.circle,
        ),
        child: Text(
          '$number',
          style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                color: const Color(0xff583732),
                fontWeight: FontWeight.bold,
              ),
        ),
      ),
    );
  }
}