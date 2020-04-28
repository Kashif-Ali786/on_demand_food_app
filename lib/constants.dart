import 'package:flutter/material.dart';

//change primary color to change app theme color
final Color kPrimaryColor = Colors.green;

final Color kFontColor = Colors.black87;
final Color kButtonFontColor = Colors.white;
final Color kBackgroundColor = Colors.white;

final TextStyle kMainFontTextStyleLight =
    TextStyle(fontSize: 18, color: kFontColor);
final TextStyle kMainFontTextStyleDark =
    TextStyle(fontSize: 18, color: Colors.white);

final TextStyle kButtonFontTextStyleLight =
    TextStyle(fontSize: 18, color: kFontColor);
final TextStyle kButtonFontTextStyleDark =
    TextStyle(fontSize: 18, color: Colors.white);

final TextStyle kMainFontTextStyleLightBold =
    TextStyle(fontSize: 18, color: kFontColor, fontWeight: FontWeight.w700);
final TextStyle kMainFontTextStyleDarkBold =
    TextStyle(fontSize: 18, color: Colors.white, fontWeight: FontWeight.w700);

final TextStyle kBigFontTextStyleLight =
    TextStyle(fontSize: 26, color: kFontColor);
final TextStyle kBigFontTextStyleDark =
    TextStyle(fontSize: 26, color: Colors.white);

final TextStyle kSubtitleFontTextStyleLight =
    TextStyle(fontSize: 15, color: kFontColor);
final TextStyle kSubtitleFontTextStyleDark =
    TextStyle(fontSize: 15, color: Colors.white);

final TextStyle kInfoFontTextStyleLight =
    TextStyle(fontSize: 22, color: Colors.black38);
final TextStyle kInfoFontTextStyleDark =
    TextStyle(fontSize: 22, color: Colors.white);

final TextStyle kBoldFont = TextStyle(fontWeight: FontWeight.w700);

//app settings, you can turn them on and off from here

//for store details page,
final bool kShowLogoInAppbar = false;

//show/hide store categories on homepage
final bool kShowStoreCategories = true;

//hide search on homepage if the app is being used for a single restaurant chain
final bool kShowStoreSearch = true;
