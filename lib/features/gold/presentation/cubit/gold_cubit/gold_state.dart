part of 'gold_cubit.dart';

sealed class GoldState {}

final class GoldInitialState extends GoldState {}

final class GoldFailureState extends GoldState {
  final String errMessage;

  GoldFailureState({required this.errMessage});
}

final class GoldSuccessState extends GoldState {
  final GoldModel goldModel;

  GoldSuccessState({required this.goldModel});
}

final class GoldLoadingState extends GoldState {}
