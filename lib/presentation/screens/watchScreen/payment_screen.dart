import 'package:adv_test/helper/resources/image_resources.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:adv_test/businessLogic/watch_bloc/watch_bloc.dart';
import 'package:adv_test/dataProvider/model/response/movie_details.dart';
import 'package:adv_test/helper/resources/dimension_resources.dart';
import 'package:adv_test/helper/resources/string_resources.dart';
import 'package:adv_test/helper/theme/app_colors.dart';
import 'package:adv_test/presentation/widgets/app_bar.dart';
import 'package:flutter_svg/svg.dart';

class PaymentScreen extends StatefulWidget {
  final MovieDetails movieDetails;

  const PaymentScreen({super.key, required this.movieDetails});

  @override
  State<PaymentScreen> createState() => _PaymentScreenState();
}

class _PaymentScreenState extends State<PaymentScreen> {
  double scale = 1.0;

  void zoomIn() {
    setState(() {
      scale += 0.1;
    });
  }

  void zoomOut() {
    setState(() {
      if (scale > 0.1) {
        scale -= 0.1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WatchBloc, WatchState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.PRIMARY_LIGHT,
          appBar: AppBarWidget(
            hideLeading: false,
            title: widget.movieDetails.title,
            subtitle: StringResources.STR_DATED,
          ),
          body: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  color: AppColors.WHITE,
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width,
                  child: Column(
                    children: [
                    Container(
                    color: AppColors.LIGHT_GREY,
                    height: Dim.D_480,
                    width: MediaQuery.of(context).size.width,
                    child: Stack(
                      children: [
                        Center(
                          child: Transform.scale(
                            scale: scale,
                            child: ClipRRect(
                              child: SvgPicture.asset(
                                ImgRes.MAP_IMAGE,
                                fit: BoxFit.cover,
                                height: Dim.D_256,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: Dim.D_20,
                          right: Dim.D_20,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              // Zoom In Button
                              InkWell(
                                onTap: (){
                                  zoomIn();
                                },
                                child: Container(
                                  height: Dim.D_30,
                                  width: Dim.D_30,
                                  decoration: BoxDecoration(
                                    color: AppColors.WHITE,
                                    borderRadius: BorderRadius.circular(Dim.D_15),
                                  ),
                                  child: Center(
                                    child: SvgPicture.asset(ImgRes.PLUS_IMAGE),
                                  ),
                                ),
                              ),
                              const SizedBox(width: Dim.D_10),

                              InkWell(
                                onTap: (){
                                  zoomOut();
                                },
                                child: Container(
                                  height: Dim.D_30,
                                  width: Dim.D_30,
                                  decoration: BoxDecoration(
                                    color: AppColors.WHITE,
                                    borderRadius: BorderRadius.circular(Dim.D_15),
                                  ),
                                  child:  Center(
                                    child: Center(
                                      child: SvgPicture.asset(ImgRes.MINUS_IMAGE),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),

                      ],
                    ),
                  ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: Dim.D_20,left: Dim.D_20),
                            child: SvgPicture.asset(
                              ImgRes.SELECTED_IMAGE,
                              width: Dim.D_20, 
                              height: Dim.D_20,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: Dim.D_16,left: Dim.D_20),
                            child: Text(
                              StringResources.STR_SELECTED,
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: AppColors.GREY,
                                fontWeight: FontWeight.w500,
                                fontSize: Dim.D_12,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: Dim.D_20,left: Dim.D_42),
                            child: SvgPicture.asset(
                              ImgRes.NOT_AVAILABLE_IMAGE,
                              width: Dim.D_20,
                              height: Dim.D_20,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: Dim.D_16,left: Dim.D_20),
                            child: Text(
                              StringResources.STR_NOT_AVAILABLE,
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: AppColors.GREY,
                                fontWeight: FontWeight.w500,
                                fontSize: Dim.D_12,
                              ),
                            ),
                          ),
                        ],

                      ),
                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: Dim.D_20,left: Dim.D_20),
                            child: SvgPicture.asset(
                              ImgRes.VIP_IMAGE,
                              width: Dim.D_20,
                              height: Dim.D_20,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: Dim.D_16,left: Dim.D_20),
                            child: Text(
                              StringResources.STR_VIP,
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: AppColors.GREY,
                                fontWeight: FontWeight.w500,
                                fontSize: Dim.D_12,
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: Dim.D_20,left: Dim.D_40),
                            child: SvgPicture.asset(
                              ImgRes.REGULAR_IMAGE,
                              width: Dim.D_20,
                              height: Dim.D_20,
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: Dim.D_16,left: Dim.D_20),
                            child: Text(
                              StringResources.STR_REGULAR,
                              style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                color: AppColors.GREY,
                                fontWeight: FontWeight.w500,
                                fontSize: Dim.D_12,
                              ),
                            ),
                          ),
                        ],

                      ),
                      Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(top: Dim.D_40,left: Dim.D_20),
                    child: Container(
                      height: Dim.D_40,
                      width: Dim.D_100,
                      decoration: BoxDecoration(
                        color: AppColors.LIGHT_GREY.withOpacity(0.4),
                        borderRadius: BorderRadius.circular(Dim.D_8),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                           Expanded(
                            child: Center(
                              child: Text(
                                StringResources.STR_ROW,
                                style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                  color: AppColors.PRIMARY_DARK,
                                  fontWeight: FontWeight.w600,
                                  fontSize: Dim.D_12,
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(right: Dim.D_4),
                            child: Container(
                              height: Dim.D_16,
                              width: Dim.D_16,
                              decoration: BoxDecoration(
                                color: Colors.transparent,
                                borderRadius: BorderRadius.circular(Dim.D_12),
                              ),
                              child: SvgPicture.asset(
                                ImgRes.CROSS_IMAGE,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
                      const Spacer(),
                      Row(
                        children: [
                          InkWell(
                            onTap: (){
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(left: Dim.D_20, right: Dim.D_20),
                              child: Container(
                                height: Dim.D_50,
                                width: Dim.D_110,
                                decoration: BoxDecoration(
                                  color: AppColors.LIGHT_GREY.withOpacity(0.5),
                                  borderRadius: BorderRadius.circular(Dim.D_10),
                                ),
                                alignment: Alignment.center,
                                child: Column(
                                  children: [
                                    const SizedBox(height: Dim.D_5),
                                    Text(
                                      StringResources.STR_TOTAL_PRICE,
                                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                        color: AppColors.PRIMARY_DARK,
                                        fontWeight: FontWeight.w500,
                                        fontSize: Dim.D_12,
                                      ),
                                    ),
                                    Text(
                                      StringResources.STR_50,
                                      style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                        color: AppColors.PRIMARY_DARK,
                                        fontWeight: FontWeight.w600,
                                        fontSize: Dim.D_16,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                          InkWell(
                            onTap: (){
                            },
                            child: Padding(
                              padding: const EdgeInsets.only(right: Dim.D_20),
                              child: Container(
                                height: Dim.D_50,
                                width: Dim.D_200,
                                decoration: BoxDecoration(
                                  color: AppColors.LIGHT_BLUE,
                                  borderRadius: BorderRadius.circular(Dim.D_10),
                                ),
                                alignment: Alignment.center,
                                child: Center(
                                  child: Text(
                                    StringResources.STR_PROCEED,
                                    style: Theme.of(context).textTheme.labelSmall?.copyWith(
                                      color: AppColors.WHITE,
                                      fontWeight: FontWeight.w600,
                                      fontSize: Dim.D_16,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: Dim.D_20),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
