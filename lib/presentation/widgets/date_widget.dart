import 'package:flutter/material.dart';

import '../../helper/resources/dimension_resources.dart';
import '../../helper/theme/app_colors.dart';

class DateWidget extends StatelessWidget {
  final VoidCallback onTapList;
  final String dates;
  final int selectedIndex;
  final int cellIndex;



  DateWidget({required this.onTapList, required this.dates, required this.selectedIndex, required this.cellIndex});

  @override
  Widget build(BuildContext context) {

    return GestureDetector(
      onTap: onTapList,
      child: Padding(
        padding:  EdgeInsets.only(right: Dim.D_10),
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: Dim.D_10, vertical: Dim.D_5),
          decoration: BoxDecoration(
            color: selectedIndex == cellIndex ? AppColors.LIGHT_BLUE : AppColors.LIGHT_GREY.withOpacity(0.5),
            borderRadius: BorderRadius.circular(Dim.D_16),
          ),
          child: Text(dates,
            style: Theme.of(context).textTheme.bodySmall!.copyWith(
              color: selectedIndex == cellIndex ? AppColors.WHITE : AppColors.PRIMARY_DARK,
              fontWeight: FontWeight.w500,
              fontSize: Dim.D_14,
            ),
          ),
        ),
      ),
    );
  }
}


