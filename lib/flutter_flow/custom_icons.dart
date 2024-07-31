import 'package:flutter/widgets.dart';

class FFIcons {
  FFIcons._();

  static const String _myFlutterAppFamily = 'MyFlutterApp';
  static const String _iconsV2Family = 'IconsV2';
  static const String _likeFamily = 'Like';

  // MyFlutterApp
  static const IconData kmenu2 =
      IconData(0xe800, fontFamily: _myFlutterAppFamily);

  // IconsV2
  static const IconData kmessage = IconData(0xe802, fontFamily: _iconsV2Family);
  static const IconData kuser = IconData(0xe803, fontFamily: _iconsV2Family);
  static const IconData kheart = IconData(0xe804, fontFamily: _iconsV2Family);

  // Like
  static const IconData kx = IconData(0xe802, fontFamily: _likeFamily);
  static const IconData kvector = IconData(0xe803, fontFamily: _likeFamily);
}
