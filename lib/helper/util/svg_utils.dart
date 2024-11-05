import 'package:flutter_svg/flutter_svg.dart';

import '../resources/image_resources.dart';

class SvgUtils {
  static List<SvgAssetLoader> svgIcons = const [
    SvgAssetLoader(ImgRes.DASHBOARD_ICON),
    SvgAssetLoader(ImgRes.WATCH_ICON),
    SvgAssetLoader(ImgRes.MEDIA_LIBRARY_ICON),
    SvgAssetLoader(ImgRes.MORE_ICON),
    SvgAssetLoader(ImgRes.SEARCH_ICON),
  ];

  static void preCacheSVGs() async {
    for (var icon in svgIcons) {
      await svg.cache.putIfAbsent(
        icon.cacheKey(null),
        () => icon.loadBytes(null),
      );
    }
  }
}
