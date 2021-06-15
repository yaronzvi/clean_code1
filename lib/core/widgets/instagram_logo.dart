import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class InstagramLogo extends StatelessWidget {
  final double? w;
  final double? h;
  const InstagramLogo({Key? key, this.h, this.w}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: w ?? 200,
      height: h ?? 100,
      child: SvgPicture.asset("lib/core/assets/Instagram_logo.svg"),
    );
  }
}
