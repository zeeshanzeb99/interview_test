import 'package:adv_test/businessLogic/api_request_status.dart';
import 'package:adv_test/businessLogic/watch_bloc/watch_bloc.dart';
import 'package:adv_test/helper/resources/dimension_resources.dart';
import 'package:adv_test/helper/resources/image_resources.dart';
import 'package:adv_test/helper/resources/string_resources.dart';
import 'package:adv_test/helper/util/utils.dart';
import 'package:adv_test/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '../../../helper/theme/app_colors.dart';

class MovieDetailsScreen extends StatefulWidget {
  final int movieId;

  const MovieDetailsScreen({super.key, required this.movieId});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {

  @override
  void initState() {
    super.initState();
    BlocProvider.of<WatchBloc>(context).add(FetchMovieDetailsEvent(movieId: widget.movieId));
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WatchBloc, WatchState>(
      listener: (context, state) {
      },
      builder: (context, state) {
        return Scaffold(
          body: state.movieDetailsARS is ApiRequestStatusLoading ?
          const Center(child:  CircularProgressIndicator(color: AppColors.SEA_GREEN))
          :Container(
            color: AppColors.WHITE,
            child: Column(
              children: [
                Expanded(
                  flex: 6,
                  child: Stack(
                    children: [
                      Container(
                        width: double.infinity,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: NetworkImage(ImgRes.DUMMY_IMAGE), // Dummy image URL
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                      Positioned(
                        top: Dim.D_40,
                        left: Dim.D_20,
                        child: Container(
                          padding: const EdgeInsets.symmetric(vertical: 4),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: Dim.D_15,
                                width: Dim.D_15,
                                child: InkWell(
                                  onTap: () {
                                    Navigator.pop(context);
                                  },
                                  child: SvgPicture.asset(
                                    ImgRes.BACK_ICON,
                                    height: Dim.D_15,
                                    width: Dim.D_15,
                                  ),
                                ),
                              ),
                              const SizedBox(width: Dim.D_15),
                              Text(
                                StringResources.STR_WATCH,
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: AppColors.WHITE,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Dim.D_16,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Align(
                        alignment: Alignment.center, // Centers the text within the Stack
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                state.movieDetails?.title ?? "",
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: AppColors.WHITE,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Dim.D_16,
                                ),
                              ),
                            ),
                            const SizedBox(height: Dim.D_10),
                            Container(
                              padding: const EdgeInsets.symmetric(vertical: 4),
                              child: Text(
                                  "${state.movieDetails?.status ?? ""} ${Utils.formatReleaseDate(state.movieDetails?.releaseDate ?? "")}",
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: AppColors.WHITE,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Dim.D_16,
                                ),
                              ),
                            ),
                            const SizedBox(height: Dim.D_10),
                            InkWell(
                              onTap: (){
                                Navigator.pushNamed(context, SELECT_SEAT_SCREEN, arguments: state.movieDetails);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: Dim.D_50, right: Dim.D_50),
                                child: Container(
                                  height: Dim.D_50,
                                  decoration: BoxDecoration(
                                    color: AppColors.LIGHT_BLUE,
                                    borderRadius: BorderRadius.circular(Dim.D_10),
                                  ),
                                  alignment: Alignment.center,
                                  child: Text(StringResources.STR_GET_TICKETS,
                                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                      color: AppColors.WHITE,
                                      fontWeight: FontWeight.w600,
                                      fontSize: Dim.D_14,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: Dim.D_10),
                            InkWell(
                              onTap: () {
                                Navigator.pushNamed(context, WATCH_TRAILER_SCREEN);
                              },
                              child: Padding(
                                padding: const EdgeInsets.only(left: Dim.D_50, right: Dim.D_50),
                                child: Container(
                                  height: Dim.D_50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(Dim.D_10),
                                    border: Border.all(
                                      color: AppColors.LIGHT_BLUE,
                                      width: Dim.D_2,
                                    ),
                                  ),
                                  alignment: Alignment.center,
                                  child: Row(
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      const Icon(
                                        Icons.play_arrow,
                                        color: AppColors.WHITE,
                                        size: Dim.D_16,
                                      ),
                                      const SizedBox(width: Dim.D_5),
                                      Text(
                                        StringResources.STR_WATCH_TRAILER,
                                        style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                          color: AppColors.WHITE,
                                          fontWeight: FontWeight.w600,
                                          fontSize: Dim.D_14,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(height: Dim.D_24),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Expanded(
                  flex: 4,
                  child: Column(
                    children: [
                      Row(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: Dim.D_40, left: Dim.D_40),
                              child: Text(
                                StringResources.STR_GET_GENRES,
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: AppColors.PRIMARY_DARK,
                                  fontWeight: FontWeight.w600,
                                  fontSize: Dim.D_16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: Dim.D_14),
                      Container(
                        height: Dim.D_30,
                        padding: const EdgeInsets.only(left: Dim.D_40),
                        child: ListView.builder(
                          itemCount: state.movieDetails?.genres?.length ?? 0,
                          scrollDirection: Axis.horizontal,
                          itemBuilder: (context, index) {
                            final genre = state.movieDetails?.genres?[index]?.name ?? '';
                            final List<Color> genreColors = [
                              AppColors.YELLOW,
                              AppColors.SEA_GREEN,
                              AppColors.PURPLE,
                              AppColors.PINK,
                            ];
                            Color backgroundColor = genreColors[index % genreColors.length];
                            return Padding(
                              padding: const EdgeInsets.only(right: Dim.D_10),
                              child: Container(
                                padding: const EdgeInsets.symmetric(horizontal: Dim.D_10, vertical: Dim.D_5),
                                decoration: BoxDecoration(
                                  color: backgroundColor,
                                  borderRadius: BorderRadius.circular(Dim.D_16),
                                ),
                                child: Text(
                                  genre,
                                  style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                    color: AppColors.WHITE, // Text color
                                    fontWeight: FontWeight.w600,
                                    fontSize: Dim.D_14,
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                      ),
                      const Padding(
                        padding:  EdgeInsets.only(left: Dim.D_40,right: Dim.D_40,top: Dim.D_20),
                        child: Divider(
                          color: AppColors.LIGHT_GREY,
                          thickness: Dim.D_1,
                        ),
                      ),
                      Row(
                        children: [
                          Center(
                            child: Padding(
                              padding: const EdgeInsets.only(top: Dim.D_20, left: Dim.D_40),
                              child: Text(
                                StringResources.STR_GET_OVERVIEW,
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: AppColors.PRIMARY_DARK,
                                  fontWeight: FontWeight.w600,
                                  fontSize: Dim.D_16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: Container(
                          padding: const EdgeInsets.only(left: Dim.D_40, right: Dim.D_40, top: Dim.D_20),
                          child: SingleChildScrollView(
                            scrollDirection: Axis.vertical,
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width,
                              child: Text(
                                state.movieDetails?.overview ?? "",
                                style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                  color: AppColors.LIGHT_GREY,
                                  fontWeight: FontWeight.w500,
                                  fontSize: Dim.D_14, // Font size
                                ),
                              ),
                            ),
                          ),
                        ),
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
