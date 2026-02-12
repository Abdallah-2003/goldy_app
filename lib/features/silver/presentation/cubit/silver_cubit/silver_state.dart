part of 'silver_cubit.dart';


sealed class SilverState {}

final class SilverInitialState extends SilverState {}
final class SilverLoadingState extends SilverState {}
final class SilverFailureState extends SilverState {
  final String errMessage;

  SilverFailureState({required this.errMessage});
}
final class SilverSuccessState extends SilverState {
  final SilverModel silverModel;

  SilverSuccessState({required this.silverModel});
}
