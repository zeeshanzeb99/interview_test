import 'package:adv_test/helper/resources/string_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../helper/resources/dimension_resources.dart';
import '../../helper/resources/image_resources.dart';
import '../../helper/theme/app_colors.dart';

class SelectSeatWidget extends StatelessWidget {
  final VoidCallback onTapList;
  final int selectedIndex;
  final int cellIndex;



  SelectSeatWidget({super.key, required this.onTapList, required this.selectedIndex, required this.cellIndex});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTapList,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Padding(
                padding: const EdgeInsets.only(right: Dim.D_10),
                child: Text(
                  StringResources.STR_TIME,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.PRIMARY_DARK,
                    fontWeight: FontWeight.w500,
                    fontSize: Dim.D_14,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: Dim.D_10),
                child: Text(
                  StringResources.STR_CINTECH,
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                    color: AppColors.LIGHT_GREY,
                    fontWeight: FontWeight.w400,
                    fontSize: Dim.D_12,
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(top: Dim.D_10,right: Dim.D_10),  // Optional padding for spacing
            child: Container(
              height: Dim.D_140,  // Set height
              width: Dim.D_256,   // Set width
              decoration: BoxDecoration(
                border: Border.all(
                  color: selectedIndex == cellIndex ? AppColors.LIGHT_BLUE : AppColors.LIGHT_GREY,
                  width: Dim.D_1,
                ),
                borderRadius: BorderRadius.circular(Dim.D_8),
              ),
              child: ClipRRect(
                borderRadius: BorderRadius.circular(Dim.D_8),
                child: Center(
                  child: SvgPicture.asset(
                    ImgRes.MAP_IMAGE,
                    fit: BoxFit.contain,
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.only(right: Dim.D_10,top: Dim.D_10),
            child: RichText(
              text: TextSpan(
                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                  color: AppColors.LIGHT_GREY,
                  fontWeight: FontWeight.w500,
                  fontSize: Dim.D_14,
                ),
                children: [
                  TextSpan(
                    text: StringResources.STR_FROM,
                  ),
                  TextSpan(
                    text: StringResources.STR_50,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: Dim.D_12, // Default font size
                    ),
                  ),
                  const TextSpan(
                    text: StringResources.STR_OR,
                  ),
                  TextSpan(
                    text: StringResources.STR_BONUS,
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                      color: Colors.black,
                      fontWeight: FontWeight.w600,
                      fontSize: Dim.D_12,
                    ),
                  ),
                ],
              ),
            ),

          ),
        ],
      ),
    );
  }
}


