import 'package:adv_test/businessLogic/watch_bloc/watch_bloc.dart';
import 'package:adv_test/dataProvider/model/response/movie_details.dart';
import 'package:adv_test/helper/resources/dimension_resources.dart';
import 'package:adv_test/helper/resources/string_resources.dart';
import 'package:adv_test/helper/theme/app_colors.dart';
import 'package:adv_test/helper/util/utils.dart';
import 'package:adv_test/presentation/router/routes.dart';
import 'package:adv_test/presentation/widgets/app_bar.dart';
import 'package:adv_test/presentation/widgets/date_widget.dart';
import 'package:adv_test/presentation/widgets/select_seat.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SelectSeatScreen extends StatefulWidget {
  final MovieDetails movieDetails;
  const SelectSeatScreen({super.key, required this.movieDetails});

  @override
  State<SelectSeatScreen> createState() => _SelectSeatScreenState();
}

class _SelectSeatScreenState extends State<SelectSeatScreen> {
  List<String> dateArray = ["3 Mar", "4 Mar", "5 Mar" ,"6 Mar", "7 Mar","8 Mar"];
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<WatchBloc, WatchState>(
      listener: (context, state) {

      },
      builder: (context, state) {
        return Scaffold(
          backgroundColor: AppColors.PRIMARY_LIGHT,
          appBar: AppBarWidget(hideLeading: false,
          title: widget.movieDetails.title,
          subtitle: "${widget.movieDetails.status} ${Utils.formatReleaseDate(widget.movieDetails.releaseDate ?? "")}"),
            body:  Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               const Padding(
                padding:  EdgeInsets.only(left: Dim.D_20, top: Dim.D_100),
                child: Text(
                  StringResources.STR_DATE,
                  style: TextStyle(
                    fontSize: Dim.D_16,
                    color: AppColors.PRIMARY_DARK,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              Container(
                height: Dim.D_40,
                padding: const EdgeInsets.only(left: Dim.D_20,top: Dim.D_10),
                child: ListView.builder(
                  itemCount: dateArray.length,
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) {
                    return DateWidget(onTapList: (){
                      BlocProvider.of<WatchBloc>(context).add(SelectDate(selectIndex: index));
                    }, dates: dateArray[index],selectedIndex: state.selectedIndex ?? 0, cellIndex: index);
                  },
                ),
              ),
              const SizedBox(height: Dim.D_35),
              Expanded(
                child: Container(
                  height: Dim.D_40,
                  padding: const EdgeInsets.only(left: Dim.D_20,top: Dim.D_10),
                  child: ListView.builder(
                    itemCount: 2,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return SelectSeatWidget(onTapList: (){
                        BlocProvider.of<WatchBloc>(context).add(SelectSeat(selectSeat: index));
                      }, selectedIndex: state.selectedSeat ?? 0, cellIndex: index);
                    },
                  ),
                ),
              ),
              const Spacer(),
              InkWell(
                onTap: (){
                  Navigator.pushNamed(context, SELECT_PAYMENT_SCREEN, arguments: widget.movieDetails);
                },
                child: Padding(
                  padding: const EdgeInsets.only(left: Dim.D_20, right: Dim.D_20),
                  child: Container(
                    height: Dim.D_50,
                    decoration: BoxDecoration(
                      color: AppColors.LIGHT_BLUE,
                      borderRadius: BorderRadius.circular(Dim.D_10),
                    ),
                    alignment: Alignment.center,
                    child: Text(StringResources.STR_SELECT_SEATS,
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
          ],
        ),
        );
      },
    );
  }
}
