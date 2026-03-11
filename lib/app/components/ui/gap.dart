import 'package:flutter/cupertino.dart';

abstract class Gap extends StatelessWidget {
  final double? height;
  final double? width;
  const Gap({super.key, this.height, this.width});

  @override
  Widget build(BuildContext context) {
  return SizedBox(height: height, width: width);
 }
}

class HGap extends Gap {
  const HGap({super.key,super.width});
  const HGap.xHalf({super.key,super.width = 2});
  const HGap.x1({super.key, super.width = 4});
  const HGap.x2({super.key, super.width = 8});
  const HGap.x3({super.key, super.width = 12});
  const HGap.x4({super.key, super.width = 16});
  const HGap.x5({super.key, super.width = 20});
  const HGap.x6({super.key, super.width = 24});
  const HGap.x7({super.key, super.width = 28});
  const HGap.x8({super.key, super.width = 32});
  const HGap.x9({super.key, super.width = 36});
  const HGap.x10({super.key, super.width = 40});
  const HGap.x11({super.key, super.width = 44});
  const HGap.x12({super.key, super.width = 48});
}

class VGap extends Gap {
  const VGap({super.key,super.height});
  const VGap.xHalf({super.key,super.height = 2});
  const VGap.x1({super.key, super.height = 4});
  const VGap.x1Half({super.key,super.height=6});
  const VGap.x2({super.key, super.height = 8});
  const VGap.x3({super.key, super.height = 12});
  const VGap.x4({super.key, super.height = 16});
  const VGap.x5({super.key, super.height = 20});
  const VGap.x6({super.key, super.height = 24});
  const VGap.x7({super.key, super.height = 28});
  const VGap.x8({super.key, super.height = 32});
  const VGap.x9({super.key, super.height = 36});
  const VGap.x10({super.key, super.height = 40});
  const VGap.x11({super.key, super.height = 44});
  const VGap.x12({super.key, super.height = 48});
}