import 'package:appwrite_toturial/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'constants.dart';

class UiContants {
  static AppBar appBar() {
    return AppBar(
      title: SvgPicture.asset(
        Svgs.twitterLogo,
        colorFilter: const ColorFilter.mode(
          Pallete.blueColor,
          BlendMode.srcIn,
        ),
        height: 36,
      ),
      centerTitle: true,
    );
  }
}
