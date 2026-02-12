import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:goldy_app/core/constant/app_colors.dart';
import 'package:goldy_app/core/constant/app_images.dart';
import 'package:goldy_app/core/constant/app_strings.dart';
import 'package:goldy_app/core/widgets/custom_text_widget.dart';
import 'package:goldy_app/features/silver/data/repos/silver_repo.dart';
import 'package:goldy_app/features/silver/presentation/cubit/silver_cubit/silver_cubit.dart';

class SilverView extends StatelessWidget {
  const SilverView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => SilverCubit(SilverRepo())..getSilver(),
      child: Scaffold(
        backgroundColor: AppColors.backGroundColor,
        appBar: AppBar(
          iconTheme: const IconThemeData(color: AppColors.silverColor),
          backgroundColor: AppColors.backGroundColor,
          centerTitle: true,
          title: const CustomTextWidget(
            title: AppStrings.silver,
            color: AppColors.silverColor,
          ),
        ),
        body: BlocBuilder<SilverCubit, SilverState>(
          builder: (context, state) {
            if (state is SilverSuccessState) {
              return Column(
                spacing: 12,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(12),
                    child: Image.asset(
                      AppImages.silverImage,
                      width: MediaQuery.sizeOf(context).width * 0.5,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    spacing: 12,
                    children: [
                      CustomTextWidget(
                        title: state.silverModel.price.toString(),
                        color: AppColors.silverColor,
                      ),
                      const CustomTextWidget(
                        title: AppStrings.usd,
                        color: AppColors.silverColor,
                      ),
                    ],
                  ),
                ],
              );
            } else if (state is SilverFailureState) {
              return const Center(child: Text(AppStrings.errMessage));
            } else {
              return const Center(
                child: CircularProgressIndicator(color: Colors.white),
              );
            }
          },
        ),
      ),
    );
  }
}
