import 'package:adv_test/helper/resources/dimension_resources.dart';
import 'package:adv_test/helper/resources/image_resources.dart';
import 'package:adv_test/presentation/screens/underDevScreen/under_dev_screen.dart';
import 'package:adv_test/presentation/screens/watchScreen/watch_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../businessLogic/nav_bloc/nav_bloc.dart';
import '../../../helper/resources/string_resources.dart';
import '../../../helper/theme/app_colors.dart';

class MainScreen extends StatefulWidget {
  final int initialIndex;

  const MainScreen({super.key, this.initialIndex = 1});

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  @override
  void initState() {
    super.initState();
    BlocProvider.of<NavBloc>(context).add(
        UpdatePageIndex(newIndex: widget.initialIndex));
  }

  final List<NavItem> unselectedNavItems = [
    NavItem(iconPath: ImgRes.DASHBOARD_ICON, label: StringResources.STR_DASHBOARD),
    NavItem(iconPath: ImgRes.WATCH_ICON, label: StringResources.STR_WATCH),
    NavItem(iconPath: ImgRes.MEDIA_LIBRARY_ICON, label: StringResources.STR_MEDIA_LIBRARY),
    NavItem(iconPath: ImgRes.MORE_ICON, label: StringResources.STR_MORE),
  ];

  final List<NavItem> selectedNavItems = [
    NavItem(iconPath: ImgRes.DASHBOARD_ICON, label: StringResources.STR_DASHBOARD),
    NavItem(iconPath: ImgRes.WATCH_ICON, label: StringResources.STR_WATCH),
    NavItem(iconPath: ImgRes.MEDIA_LIBRARY_ICON, label: StringResources.STR_MEDIA_LIBRARY),
    NavItem(iconPath: ImgRes.MORE_ICON, label: StringResources.STR_MORE),
  ];


  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NavBloc, NavState>(
      listener: (context, state) {},
      builder: (context, state) {
        int currentIndex = state.currentIndex;
        return Scaffold(
          body: IndexedStack(
            index: state.currentIndex,
            children: const [
              UnderDevScreen(),
              WatchScreen(),
              UnderDevScreen(),
              UnderDevScreen(),
            ],
          ),
          bottomNavigationBar: Container(
            decoration: BoxDecoration(
              color: AppColors.PRIMARY_DARK,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(Dim.D_25.sp),
                  topRight: Radius.circular(Dim.D_25.sp),
              ),
            ),
            child: Padding(
              padding:  EdgeInsets.symmetric(horizontal: 8.sp, vertical: 10.sp),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: List.generate(4, (index) {
                      return Expanded(
                        child: InkWell(
                          onTap: () {
                            if (index != state.currentIndex) {
                              BlocProvider.of<NavBloc>(context)
                                  .add(UpdatePageIndex(newIndex: index));
                            }
                          },
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SvgPicture.asset(
                                currentIndex == index
                                    ? selectedNavItems[index].iconPath
                                    : unselectedNavItems[index].iconPath,
                                width: Dim.D_24.sp,
                                height: Dim.D_24.sp,
                              ),
                              SizedBox(height: Dim.D_5.sp),
                              Text(
                                unselectedNavItems[index].label,
                                style: TextStyle(
                                  fontWeight: currentIndex == index
                                      ? FontWeight.bold
                                      : FontWeight.w200,
                                  color: currentIndex == index
                                      ? AppColors.PRIMARY_LIGHT
                                      : AppColors.GREY,
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    }),
                  )
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class NavItem {
  final String iconPath;
  final String label;

  NavItem({required this.iconPath, required this.label});
}

class AppBarItems {
  final String title;
  final String label;

  AppBarItems({required this.title, required this.label});
}
