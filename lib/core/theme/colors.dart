import 'package:flutter/material.dart';

/// A class that contains the color definitions used in the app.
class ColorsManager {
  //app colors
  static const Color appPrimaryColor = Color(0xff5f33e1);
  static const Color appBoardersColor = Color(0xffbababa);

  // Primary Colors
  static const Color primaryOrange50 = Color(0xFFFFF7EB); // #FFF7EB
  static const Color primaryOrange100 = Color(0xFFFFEDD6); // #FFEDD6
  static const Color primaryOrange200 = Color(0xFFFFE7C2); // #FFE7C2
  static const Color primaryOrange300 = Color(0xFFFFDEAD); // #FFDEAD
  static const Color primaryOrange400 = Color(0xFFFFD699); // #FFD699
  static const Color primaryOrange500 = Color(0xFFFFCE85); // #FFCE85
  static const Color primaryOrange600 = Color(0xFFFFC670); // #FFC670
  static const Color primaryOrange700 = Color(0xFFFFBE5C); // #FFBE5C
  static const Color primaryOrange800 = Color(0xFFFFB647); // #FFB647
  static const Color primaryOrange900 = Color(0xFFFFA51F); // #FFA51F
  static const Color primaryOrange950 = Color(0xFFFF9900); // #FF9900

  // Secondary Black Colors
  static const Color secondaryBlack50 = Color(0xFFF5F5F5); // #F5F5F5
  static const Color secondaryBlack100 = Color(0xFFE0E0E0); // #E0E0E0
  static const Color secondaryBlack200 = Color(0xFFB8B8B8); // #B8B8B8
  static const Color secondaryBlack300 = Color(0xFF8F8F8F); // #8F8F8F
  static const Color secondaryBlack400 = Color(0xFF707070); // #707070
  static const Color secondaryBlack500 = Color(0xFF5C5C5C); // #5C5C5C
  static const Color secondaryBlack600 = Color(0xFF474747); // #474747
  static const Color secondaryBlack700 = Color(0xFF3D3D3D); // #3D3D3D
  static const Color secondaryBlack800 = Color(0xFF333333); // #333333
  static const Color secondaryBlack900 = Color(0xFF292929); // #292929
  static const Color secondaryBlack950 = Color(0xFF1A1A1A); // #1A1A1A

  static const Color neutralGrayWhite = Color(0xFFFFFFFF); // #FFFFFF
  static const Color neutralGray20 = Color(0xFFF5F5F5); // #F2F2F2
  static const Color neutralGray50 = Color(0xFFFAFAFA); // #FAFAFA

  static const Color neutralGray100 = Color(0xFFF5F5F5); // #F5F5F5
  static const Color neutralGray200 = Color(0xFFE5E5E5); // #E5E5E5
  static const Color neutralGray300 = Color(0xFFD4D4D4); // #D4D4D4
  static const Color neutralGray400 = Color(0xFFA3A3A3); // #A3A3A3
  static const Color neutralGray500 = Color(0xFF737373); // #737373
  static const Color neutralGray600 = Color(0xFF525252); // #525252
  static const Color neutralGray700 = Color(0xFF404040); // #404040
  static const Color neutralGray800 = Color(0xFF262626); // #262626
  static const Color neutralGray900 = Color(0xFF171717); // #171717
  static const Color neutralGray950 = Color(0xFF0A0A0A); // #0A0A0A
  static const Color neutralGrayBlack = Color(0xFF000000); // #000000

  // Success Green Colors
  static const Color successGreen50 = Color(0xFFF0FDF4); // #F0FDF4
  static const Color successGreen100 = Color(0xFFDCFCE7); // #DCFCE7
  static const Color successGreen200 = Color(0xFFBBF7D0); // #BBF7D0
  static const Color successGreen300 = Color(0xFF86EFAC); // #86EFAC
  static const Color successGreen400 = Color(0xFF4ADE80); // #4ADE80
  static const Color successGreen500 = Color(0xFF22C55E); // #22C55E
  static const Color successGreen600 = Color(0xFF16A34A); // #16A34A
  static const Color successGreen700 = Color(0xFF15803D); // #15803D
  static const Color successGreen800 = Color(0xFF14532D); // #14532D
  static const Color successGreen900 = Color(0xFF052E16); // #052E16

  // Danger Red Colors
  static const Color dangerRed50 = Color(0xFFFFF2F2); // #FFF2F2
  static const Color dangerRed100 = Color(0xFFFEE2E2); // #FEE2E2
  static const Color dangerRed200 = Color(0xFFFECACA); // #FECACA
  static const Color dangerRed300 = Color(0xFFFCA5A5); // #FCA5A5
  static const Color dangerRed400 = Color(0xFFF87171); // #F87171
  static const Color dangerRed500 = Color(0xFFEF4444); // #EF4444
  static const Color dangerRed600 = Color(0xFFDC2626); // #DC2626
  static const Color dangerRed700 = Color(0xFFB91C1C); // #B91C1C
  static const Color dangerRed800 = Color(0xFF991B1B); // #991B1B
  static const Color dangerRed900 = Color(0xFF7F1D1D); // #7F1D1D
  static const Color dangerRed950 = Color(0xFF450A0A); // #450A0A

  static const Color PRIMARY_COLOR = Color(0xFF307F3E);
  static const Color BACKGROUND_LIGHT = Color(0xFFF9F9F9);
  static const Color DARK_PRIMARY_COLOR = Color(0xFF1A1A1A);
  static const Color ALPHA_PRIMARY_COLOR = Color(0x1A713188);
  static const Color SECONDARY_COLOR = Color(0Xffff4f8f5);
  static const Color FAB_SECONDARY_COLOR = Color(0XFFD9D9D9);
  static const Color FAB_COLOR = Color(0xF0FFE5CD);
  static const Color TEXT_PRIMARY_COLOR = Color(0xff342E58);
  static const Color TEXT_ERROR_COLOR = Color(0xffDC031E);
  static const Color TEXT_BLUE_COLOR = Color(0xff0042A5);
  static const Color BLACK_COLOR = Color(0xff000000);
  static const Color TEXT_SECONDARY_COLOR = Color(0xff555555);
  static const Color TEXT_GREY_COLOR = Color(0xfffd5d5d5);
  static const Color TEXT_SECONDARY_DARK_COLOR = Color(0xff333333);
  static const Color TEXT_SECONDARY_DISABLE_COLOR = Color(0xffCCCCCC);
  static const Color TEXT_SECONDARY_DESCRIPTION_COLOR = Color(0xff413C45);
  static const Color TEXT_SECONDARY_INACTIVE_COLOR = Color(0xff949494);
  static const Color BORDER_COLOR = Color(0xffB7B7B7);
  static const Color HINT_TEXT_COLOR = Color(0xffB7B7B7);
  static const Color DISABLED_TEXT_COLOR = Color(0xff8D8A8F);
  static const Color FACEBOOK_COLOR = Color(0xff276FBF);
  static const Color X_COLOR = Color(0xff000000);
  static const Color GOOGLE_COLOR = Color(0xffDB4437);
  static const Color APPLE_COLOR = Color(0xff000000);
  static const Color ICON_COLOR = Color(0xff272633);
  static const Color SELECTED_NAV_COLOR = Color(0xffffffff);
  static const Color UNSELECTED_NAV_COLOR = Color(0x6EE0E0E0);
  static const Color CARD_BACKGROUND_COLOR = Color(0x40A6A6A6);
  static const Color PIN_BACKGROUND_COLOR = Color(0xffD6D6D6);
  static const Color FAB_SALON_ALPHA_COLOR = Color(0x36F0C786);
  static const Color TAB_BACKGROUND_COLOR = Color(0xFFD9D9D9);
  static const Color WHITE_COLOR = Color(0x00ffffff);
  static const Color GREY_COLOR2 = Color(0xFFAEAEAE);
  static const Color LINE_COLOR = Color(0x80F0C786);
  static const Color READ_NOTIFICATION_COLOR = Color(0x4AB8B8B8);
  static const Color ANNOUNCEMENT_BACK_COLOR = Color(0xFFF2F2F2);
  static const Color SECONDARY_CHECK_MED_CARD_COLOR = Color(0xFFF1EAF3);
}







































//  /// A dark version of the primary color used for the card background.
//   static Color ketchUp = const Color(0xffFCE1E1);

//   /// A light version of the primary color used for the card background.
//   static Color lightPrimary = const Color(0xffF6A1A1);
//   // static Color primary = const Color(0xfff2cc5b);

//   /// White color.
//   static Color white = const Color(0xffffffff);

//   static Color inputHintColor = const Color(0xffBEC5D1);

//   /// A light blue color used for the header of the home page.
//   static Color lightBlue = const Color(0xffF1F2F8);

//   /// A dark grey color used for the text and the border of the card in the home page.

//  /// A dark yellow color used for the title of the user profile page.
//   static Color darkYellow = const Color(0xffD29634);

//   /// A green color used for the title of the user profile page.
//   static Color green = const Color(0xff2AA952);

//   /// A grey color used for the text of the login page.
//   static Color grey0 = Colors.grey.shade300;

//   /// A grey color used for the text of the login page.
//   static Color grey = const Color(0xff666666);

//   /// A grey color used for the text of the login page.
//   static Color grey2 = const Color(0xff9B9B9B);

//   /// A grey color used for the text of the login page.
//   static Color grey3 = const Color(0xff707070);

//   /// A dark grey color used for the text of the login page.
//   static Color grey4 = Colors.grey.shade700;

//   /// An error color used for the error message in the login page.
//   static Color error = const Color(0xffe61f34);

//   /// Black color.
//   static Color black = const Color(0xff000000);

//   /// A light black color used for the shadow of the profile page.
//   static Color lightBlack = Colors.black26;

//   static Color ocean = const Color(0xffF5F9FF);

//   /// A medium black color used for the border of the card in the home page.
//   static Color mediumBlack = Colors.black45;

//   static Color greenApp = const Color(0xff5ABE7D);
//   static Color redApp = const Color(0xffD32A2A);
//   static Color arrowListTile = const Color(0xff000C23);
//   static Color profileText = const Color(0xff637289);