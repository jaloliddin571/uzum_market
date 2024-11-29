import 'package:flutter/material.dart';

import '../../../../../components/constants/image.dart';
import '../../../../../components/constants/mediaquater.dart';

class PageViewWidget extends StatelessWidget {
  String image;
   PageViewWidget({super.key , required this.image});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: m_w(context) * 0.5,
      width: double.infinity,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(image),
        ),
      ),
    );
  }
}
