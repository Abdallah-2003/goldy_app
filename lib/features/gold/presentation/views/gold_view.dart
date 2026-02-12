import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy_app/core/constant/app_colors.dart';
import 'package:goldy_app/core/constant/app_images.dart';
import 'package:goldy_app/core/constant/app_strings.dart';
import 'package:goldy_app/features/gold/data/repos/gold_repo.dart';
import 'package:goldy_app/features/gold/presentation/cubit/gold_cubit/gold_cubit.dart';
import 'package:goldy_app/core/widgets/custom_text_widget.dart';

class GoldView extends StatelessWidget {
  const GoldView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => GoldCubit(GoldRepo())..getGold(),
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.goldColor),
          backgroundColor: AppColors.backGroundColor,
          centerTitle: true,
          title: const CustomTextWidget(
            title: AppStrings.gold,
            color: AppColors.goldColor,
          ),
        ),
        body: BlocBuilder<GoldCubit, GoldState>(
          builder: (context, state) {
            if (state is GoldSuccessState) {
              return Column(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      AppImages.goldImage,
                      width: MediaQuery.sizeOf(context).width * 0.5,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 12,
                    children: [
                      CustomTextWidget(
                        title: state.goldModel.price.toString(),
                        color: AppColors.goldColor,
                      ),
                      const CustomTextWidget(
                        title: AppStrings.usd,
                        color: AppColors.goldColor,
                      ),
                    ],
                  ),
                ],
              );
            } else if (state is GoldLoadingState) {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            } else {
              return const Center(child: Text(AppStrings.errMessage));
            }
          },
        ),
      ),
    );
  }
}
