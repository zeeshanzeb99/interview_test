import 'package:adv_test/helper/resources/image_resources.dart';
import 'package:adv_test/helper/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../helper/resources/dimension_resources.dart';

class AppBarWidget extends StatelessWidget implements PreferredSizeWidget {
  const AppBarWidget({
    Key? key,
    String? title,
    this.subtitle,      // Add subtitle parameter
    this.onTap,
    this.hideLeading = false,
    List<Widget>? actions,
    this.bgColor,
    this.boxShadow,
    this.leadingIcon,
    this.imageWidget,
  })  : _title = title ?? '',
        _actions = actions,
        super(key: key);

  final String _title;
  final String? subtitle;  // Subtitle text
  final List<Widget>? _actions;
  final Widget? imageWidget;
  final Color? bgColor;
  final bool hideLeading;
  final BoxShadow? boxShadow;
  final Function()? onTap;
  final Icon? leadingIcon;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(boxShadow: boxShadow != null ? [boxShadow!] : null),
      child: AppBar(
        backgroundColor: bgColor ?? AppColors.WHITE,
        elevation: Dim.D_0,
        title: imageWidget ??
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: Dim.D_10),
                Text(
                  _title,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.PRIMARY_DARK,
                    fontWeight: FontWeight.w500,
                    fontSize: Dim.D_16,
                  ),
                ),
                const SizedBox(height: Dim.D_4),
                if (subtitle != null)
                  Text(
                    subtitle!,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: AppColors.LIGHT_BLUE,
                      fontSize: Dim.D_12,
                      fontWeight: FontWeight.w500
                    ),
                  ),
              ],
            ),
        centerTitle: true,
        leading: hideLeading
            ? null
            : IconButton(
          icon: SvgPicture.asset(ImgRes.BACK_BLACK_ICON),
          onPressed: onTap ??
                  () {
                FocusManager.instance.primaryFocus?.unfocus();
                Navigator.of(context).pop();
              },
        ),
        actions: _actions,
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(Dim.D_60);
}
