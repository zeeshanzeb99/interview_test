import 'package:adv_test/businessLogic/watch_bloc/watch_bloc.dart';
import 'package:adv_test/helper/resources/dimension_resources.dart';
import 'package:adv_test/helper/resources/image_resources.dart';
import 'package:adv_test/helper/resources/string_resources.dart';
import 'package:adv_test/helper/theme/app_colors.dart';
import 'package:adv_test/presentation/router/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class WatchScreen extends StatefulWidget {
  const WatchScreen({super.key});

  @override
  State<WatchScreen> createState() => _WatchScreenState();
}

class _WatchScreenState extends State<WatchScreen> {

  FocusNode searchFocusNode = FocusNode();

  @override
  void initState() {
    BlocProvider.of<WatchBloc>(context).add(FetchUpcomingMoviesEvent());
    BlocProvider.of<WatchBloc>(context).add(FetchMovieCategoriesEvent());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WatchBloc, WatchState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        final upcomingMovies = state.upcomingMovies;
        final movieCategories = state.movieCategories;
        return Scaffold(
          backgroundColor: AppColors.PRIMARY_LIGHT,
          appBar: AppBar(
            backgroundColor: AppColors.WHITE,
            title: state.isSearchOpened
                ? Container(
              height: Dim.D_50.sp,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.PRIMARY_LIGHT,
                borderRadius: BorderRadius.circular(Dim.D_30.sp),
              ),
              child: Center(
                child: TextFormField(
                  focusNode: searchFocusNode,
                  autofocus: true,
                  decoration: InputDecoration(
                    hintText: StringResources.STR_TV_SHOWS,
                    hintStyle: const TextStyle(
                      color: AppColors.LIGHT_GREY,
                      fontSize: Dim.D_14,
                    ),
                    border: InputBorder.none,
                    contentPadding: EdgeInsets.symmetric(horizontal: Dim.D_20.sp),
                    prefixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: Dim.D_8.sp),
                      child: SvgPicture.asset(
                        ImgRes.SEARCH_ICON,
                        width: Dim.D_16.sp,
                        height: Dim.D_16.sp,
                      ),
                    ),
                    prefixIconConstraints: const BoxConstraints(
                      minWidth: Dim.D_0,
                      minHeight: Dim.D_0,
                    ),
                    suffixIcon: Padding(
                      padding: EdgeInsets.symmetric(horizontal: Dim.D_8.sp),
                      child: InkWell(
                        onTap: () {
                          searchFocusNode.unfocus();
                          BlocProvider.of<WatchBloc>(context).add(CloseSearch());
                        },
                        child: SvgPicture.asset(
                          ImgRes.CANCEL_ICON,
                          width: Dim.D_14.sp,
                          height: Dim.D_14.sp,
                        ),
                      ),
                    ),
                    suffixIconConstraints: const BoxConstraints(
                      minWidth: Dim.D_0,
                      minHeight: Dim.D_0,
                    ),
                  ),
                  onChanged: (query) {
                    BlocProvider.of<WatchBloc>(context).add(UpdateSearchQuery(searchQuery: query));
                  },
                ),
              ),
            )

                : const Text(StringResources.STR_WATCH, style: TextStyle(
              fontWeight: FontWeight.w700,
              color: AppColors.PRIMARY_DARK

            ),),
            actions: state.isSearchOpened
                ? [

            ]
                : [
              InkWell(
                onTap: () {
                  BlocProvider.of<WatchBloc>(context).add(SetSearch());
                },
                child: SvgPicture.asset(
                  ImgRes.SEARCH_ICON,
                  width: 24.sp,
                  height: 24.sp,
                ),
              ),
              SizedBox(width: 10.sp),
            ],
          ),

          body: Padding(
            padding: EdgeInsets.symmetric(horizontal: Dim.D_16.sp),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: Dim.D_16.sp,),
                if (state.searchQuery.isEmpty && state.isSearchOpened == false)
                  Expanded(
                    child: ListView.builder(
                        itemCount: upcomingMovies.length,
                        itemBuilder: (context, index) {
                          final movie = upcomingMovies[index];
                          final image = placeholderBanners[index % placeholderBanners.length];
                          return InkWell(
                            onTap: (){
                              Navigator.pushNamed(context, MOVIE_DETAILS_SCREEN, arguments: upcomingMovies[index].id);
                            },
                            child: Padding(
                              padding: EdgeInsets.symmetric(vertical: Dim.D_4.sp),
                              child: Container(
                                height: Dim.D_180.sp,
                                width: double.infinity,
                                decoration: BoxDecoration(
                                  color: AppColors.LIGHT_GREY,
                                  borderRadius:
                                      BorderRadius.circular(Dim.D_10.sp),
                                  image: DecorationImage(
                                    image: NetworkImage(
                                        image),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsets.only(left: Dim.D_12.sp, bottom: Dim.D_12.sp ),
                                  child: Align(
                                    alignment: Alignment.bottomLeft,
                                      child: Text(
                                       movie.originalTitle ?? '',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall!
                                            .copyWith(
                                            color: AppColors.PRIMARY_LIGHT, fontWeight: FontWeight.bold, fontSize: Dim.D_15),
                                      ),
                                  ),
                                ),
                              ),
                            ),
                          );
                        }),
                  ),
                if (state.searchQuery.isEmpty && state.isSearchOpened == true)
                  Expanded(
                    child: GridView.builder(
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          crossAxisSpacing: 4.0,
                          mainAxisSpacing: 4.0),
                      itemCount: movieCategories.length,
                      itemBuilder: (context, index) {
                        final category = movieCategories[index];
                        final image = placeholderBanners[index % placeholderBanners.length];
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: Dim.D_4.sp),
                          child: Container(
                            height: Dim.D_180.sp,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.PRIMARY_LIGHT,
                              borderRadius:
                              BorderRadius.circular(Dim.D_10.sp),
                              image: DecorationImage(
                                image: NetworkImage(
                                    image),
                                fit: BoxFit.cover,
                              ),
                            ),
                            child: Padding(
                              padding: EdgeInsets.only(left: Dim.D_12.sp, bottom: Dim.D_12.sp ),
                              child: Align(
                                alignment: Alignment.bottomLeft,
                                child: Text(
                                  category.categoryTitle ?? '',
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: AppColors.PRIMARY_LIGHT),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ),
                  ),


                if (state.searchQuery.isNotEmpty && state.isSearchOpened == true)...[
                  Text(state.filteredMovies.isEmpty ? StringResources.STR_NO_RESULTS: StringResources.STR_TOP_RESULTS, style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.PRIMARY_DARK),),
                  SizedBox(height: 5.sp,),
                  const Divider(),
                  SizedBox(height: 5.sp,)
                ],


                if (state.searchQuery.isNotEmpty && state.isSearchOpened == true)
                  Expanded(
                    child: ListView.builder(
                        itemCount: state.filteredMovies.length,
                        itemBuilder: (context, index) {
                          final movie = state.filteredMovies[index];
                          final image = placeholderBanners[index % placeholderBanners.length];
                          return InkWell(
                            onTap: (){},
                            child: Container(
                              height: Dim.D_180,
                              padding: const EdgeInsets.symmetric(vertical: 8.0),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  AspectRatio(
                                    aspectRatio: 0.9,
                                    child: Container(
                                      height: 180,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(Dim.D_10.sp),
                                        image: DecorationImage(
                                          image: NetworkImage(image),
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(width: Dim.D_8.sp),
                                  Expanded(
                                    child: Column(
                                      mainAxisSize: MainAxisSize.min,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          movie.originalTitle ?? '',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1,
                                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                            color: AppColors.PRIMARY_DARK,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        const SizedBox(height: 4.0),
                                        Text(
                                          movie.title ?? '',
                                          overflow: TextOverflow.ellipsis,
                                          maxLines: 1, // Limit subtitle to a single line
                                          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                                            color: AppColors.LIGHT_GREY,
                                            fontWeight: FontWeight.w100,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  SizedBox(width: Dim.D_8.sp),
                                  const Text(
                                    '•••',
                                    style: TextStyle(
                                      color: AppColors.LIGHT_BLUE,
                                      fontSize: Dim.D_20,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          )
                          ;
                        }),
                  ),


              ],
            ),
          ),
        );
      },
    );
  }
}
